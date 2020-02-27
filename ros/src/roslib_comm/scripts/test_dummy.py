#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from shared_msgs.msg import imu_msg

def talker():
    rospy.init_node('test_dummy', anonymous=True)
    pub = rospy.Publisher('/imu', Twist, queue_size=10)
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        msg = Twist()
        msg.linear.x = 0
        msg.linear.y = 1
        msg.linear.z = -1
        msg.angular.x = 0
        msg.angular.y = 1
        msg.angular.z = -1
        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    talker()