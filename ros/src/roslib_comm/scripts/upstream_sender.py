#!/usr/bin/env python3
# license removed for brevity
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist

def talker():
    pub = rospy.Publisher('/upstream_data', Twist, queue_size=10)
    rospy.init_node('upstream_sender', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        imu = Twist()
        imu.linear.x = 1
        imu.linear.y = -1
        imu.linear.z = 0
        imu.angular.x = 1
        imu.angular.y = -1
        imu.angular.z = 0
        rospy.loginfo(imu)
        pub.publish(imu)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass