#! /usr/bin/python
import rospy
import time
from shared_msgs.msg import controller_msg

if __name__ == "__main__":
    rospy.init_node("dumb_controller")
    pub = rospy.Publisher("/surface/controller", controller_msg, queue_size=2)
    while (True):
        time.sleep(.1)
        m = controller_msg()

        x = float(input("give and X value:"))
        y = float(input("give and Y value:"))
        z = float(input("give and Z value:"))
        t = float(input("give and Throttle value:"))
        rt = float(input("give a Right trigger value"))
        lt = float(input("give a Left trigger value"))
        m.RX_axis = x
        m.RY_axis = y
        m.LX_axis = z
        m.LY_axis = t
        m.Rtrigger = rt
        m.Ltrigger = lt
        pub.publish(m)
        print(m)
        print("-----------published------------")
        print("-----press ctrl-z to exit-------")
