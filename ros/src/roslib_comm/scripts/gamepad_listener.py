#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from shared_msgs.msg import controller_msg
import json

pub = rospy.Publisher('/gamepad_listener', controller_msg, queue_size=10)

'''
class Callback():
    def __init__(self):
        self.pub = rospy.Publisher('/gamepad_listener', controller_msg, queue_size=10)
    
    def callback(self, data):
        stuff = json.loads(data.data)
        msg = controller_msg()
        msg.RX_axis = stuff['RSX']
        msg.RY_axis = stuff['RSY']
        msg.LX_axis = stuff['LSX']
        msg.LY_axis = stuff['LSY']
        msg.a = stuff['A']
        msg.b = stuff['B']
        msg.x = stuff['X']
        msg.y = stuff['Y']
        msg.DPadX = stuff['DPADX']
        msg.DPadY = stuff['DPADY']
        msg.RB = stuff['RB']
        msg.LB = stuff['LB']
        msg.Rtrigger = stuff['RT']
        msg.Ltrigger = stuff['LT']
        rospy.loginfo(msg)
        self.pub.publish(msg)

'''


def callback(data):
    stuff = json.loads(data.data)
    msg = controller_msg()
    msg.RX_axis = stuff['RSX']
    msg.RY_axis = stuff['RSY']
    msg.LX_axis = stuff['LSX']
    msg.LY_axis = stuff['LSY']
    msg.a = stuff['A']
    msg.b = stuff['B']
    msg.x = stuff['X']
    msg.y = stuff['Y']
    msg.DPadX = stuff['DPADX']
    msg.DPadY = stuff['DPADY']
    msg.RB = stuff['RB']
    msg.LB = stuff['LB']
    msg.Rtrigger = stuff['RT']
    msg.Ltrigger = stuff['LT']
    rospy.loginfo(msg)
    pub.publish(msg)


def listener():
    rospy.init_node('gp_listen', anonymous=True)
    
    rospy.Subscriber('chatter', String, callback)

    rospy.spin()


if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass
