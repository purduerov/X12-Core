#! /usr/bin/python
import rospy
import enum
from shared_msgs.msg import controller_msg, thrust_command_msg, thrust_disable_inverted_msg, tools_command_msg
class Coord(enum.Enum):
    ROV_Centric = 1
    POOL_Centric = 2
class Contr_Type(enum.Enum):
    Percent_Power = 1
    Thrust = 2

controller_percent_power = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
controller_tools_command = [0,0,0,0]
translation_Scaling = .5
rotation_Scaling = .4

def onLoop():
    #Thruster Control
    thrust_command = thrust_command_msg()
    thrust_command.desired_thrust = controller_percent_power
    thrust_command_pub.publish(thrust_command)
    #Tools Control
    tools_command = tools_command_msg()
    tools_command.manipulator = controller_tools_command[0]
    tools_command_pub.publish(tools_command)

def _controller_input(contr):
    controller_percent_power[0] = -contr.LY_axis * translation_Scaling # translational
    controller_percent_power[1] = -contr.LX_axis * translation_Scaling # translation
    controller_percent_power[2] = ((contr.Rtrigger + 1) - (contr.Ltrigger + 1)) * translation_Scaling
    if contr.a == 1:
        controller_percent_power[3] = 1 * rotation_Scaling
    elif contr.b == 1:
        controller_percent_power[3] = -1 * rotation_Scaling
    else:
        controller_percent_power[3] = 0.0
    controller_percent_power[4] = -contr.RY_axis * rotation_Scaling# pitch
    controller_percent_power[5] = -contr.RX_axis * rotation_Scaling # yaw
    if contr.x == 1:
        controller_tools_command[0] = 1
    if contr.y ==1:
        controller_tools_command[0] = 0


if __name__ == '__main__':
    rospy.init_node('ROV_main')
    controller_sub = rospy.Subscriber('/gamepad_listener', controller_msg,_controller_input)
    thrust_command_pub = rospy.Publisher('/thrust_command', thrust_command_msg, queue_size=1)
    tools_command_pub = rospy.Publisher('/tools_proc', tools_command_msg, queue_size=10)
    r = rospy.Rate(1)
    while not rospy.is_shutdown():
        onLoop()
        r.sleep()
