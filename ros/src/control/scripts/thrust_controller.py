#! /usr/bin/python
import rospy
import enum
from shared_msgs.msg import controller_msg, thrust_command_msg, thrust_disable_inverted_msg
class Coord(enum.Enum):
    ROV_Centric = 1
    POOL_Centric = 2
class Contr_Type(enum.Enum):
    Percent_Power = 1
    Thrust = 2
controller_percent_power = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
translation_Scaling = .3
rotation_Scaling = .2

def onLoop():
    output = thrust_command_msg()
    output.desired_thrust = controller_percent_power
    thrust_command_pub.publish(output)


def _controller_input(contr):
    controller_percent_power[0] = contr.LX_axis * translation_Scaling # translational
    controller_percent_power[1] = contr.LY_axis * translation_Scaling # translation
    controller_percent_power[2] = ((1 - contr.Rtrigger * -1) - (1 - contr.Ltrigger * -1)) * translation_Scaling
    if contr.a == 1:
        controller_percent_power[3] = 1 * rotation_Scaling
    elif contr.b == 1:
        controller_percent_power[3] = -1 * rotation_Scaling
    else:
        controller_percent_power[3] = 0.0
    controller_percent_power[4] = contr.RY_axis * rotation_Scaling# pitch
    controller_percent_power[5] = contr.RX_axis * rotation_Scaling # yaw

    print("message")


if __name__ == '__main__':
    rospy.init_node('thrust_controller')
    controller_sub = rospy.Subscriber('gamepad_listener', controller_msg,_controller_input)
    thrust_command_pub = rospy.Publisher('thrust_command', thrust_command_msg, queue_size=1)
    rospy.Rate(10)
    while not rospy.is_shutdown():
        onLoop()
