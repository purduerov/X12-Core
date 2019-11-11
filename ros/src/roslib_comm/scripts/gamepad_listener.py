#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from shared_msgs.msg import controller_msg

def callback(data):
    rospy.loginfo('we did it reddit')
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data)
    pub.publish(data)
    
def listener():

    rospy.init_node('downstream_sub', anonymous=True)
    rospy.Subscriber('downstream', controller_msg, callback)
    pub = rospy.Publisher('/surface/controller', controller_msg)
    rospy.spin()

if __name__ == '__main__':
    listener()
