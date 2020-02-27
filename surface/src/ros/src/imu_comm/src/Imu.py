#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
import json

def callback(data):
    #stuff = {'xo': data.angular.x, 'yo': data.angular.y, 'zo': data.angular.z, 'xa': data.linear.x, 'ya': data.linear.y, 'za': data.linear.z}
    stuff = {'orientation': {'x': data.angular.x, 'y': data.angular.y, 'z': data.angular.z},
            'acceleration': {'x': data.linear.x, 'y': data.linear.y, 'z': data.linear.z}}
    jsonstuff = json.dumps(stuff)
    print(jsonstuff, flush=True, end=' ')

def listener():
    rospy.init_node('surface_imu', anonymous=True)
    rospy.Subscriber('/surface_imu', Twist, callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass