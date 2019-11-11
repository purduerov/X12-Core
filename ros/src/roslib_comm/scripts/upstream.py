#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from std_msgs.msg import Twist

def talker() :
    pub = rospy.Pulisher('/upstream', Twist, queue_size=10)
    rospy.init_node('upstream_pub', anonymous=True)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown() :
        mes = {
            linear : {
                 x : 0.1,
                y : 0.2,
                z : 0.3
            },
            angular : {
                x : -0.1,
                y : -0.2,
                z : -0.3
            }
        }
        rospy.loginfo(mes)
        pub.publish(mes)
        rate.sleep()


if __name__ == '__main__' :
    try:
        talker()
    except rospy.ROSInterruptException:
        pass

