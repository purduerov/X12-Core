#! /usr/bin/python
import rospy
import enum
from shared_msgs.msg import controller_msg
class Coord(enum.Enum):
    ROV_Centric = 1
    POOL_Centric = 2
class Contr_Type(enum.Enum):
    Percent_Power = 1
    Thrust = 2

command_vector = [0.0,0.0,0.0,0.0,0.0,0.0]

def init():

def onLoop():
    desired_p_unramped[0] = contr.LX_axis  # translational
    desired_p_unramped[1] = contr.LY_axis  # translation
    desired_p_unramped[2] = contr.Rtrigger - contr.Ltrigger
    if contr.a == 1:
        desired_p_unramped[3] = .3
    elif contr.b == 1:
        desired_p_unramped[3] = -.3
    else:
        desired_p_unramped[3] = 0.0
    desired_p_unramped[4] = contr.RY_axis  # pitch
    desired_p_unramped[5] = contr.RX_axis  # yaw
    print("message")
def onStop():

def percentPower2Thrust(power):


if __name__ == '__main__':
    rospy.Subscriber('gamepad_listener', controller_msg,)
