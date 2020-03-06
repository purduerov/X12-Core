#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32

def talker():
    rospy.init_node('dummy', anonymous=True)
    pub = rospy.Publisher('chatter', Float32, queue_size=10)
    rate = rospy.Rate(0.05)
    i = 0
    while not rospy.is_shutdown():
        if i%2 == 0:
            angle = 30.0
            print(angle)
            pub.publish(angle)
        else:
            angle = 120.0
            print(angle)
            pub.publish(angle)
        i += 1

        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
