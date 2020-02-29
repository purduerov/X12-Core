#!/usr/bin/env python3

import rospy
from std_msgs.msg import Float32
import json

def callback(data):
    jsonstuff = json.dumps(data.data)
    #jsonstuff = json.dumps(None)
    print(jsonstuff, flush=True, end=' ')

def listener():
    rospy.init_node('surface_depth', anonymous=True)
    
    rospy.Subscriber('/surface_depth', Float32, callback)

    rospy.spin()

if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass