#! /usr/bin/python
import rospy
# import ms5837
import ms5837
from std_msgs.msg import Float32

if __name__ == "__main__":
    rospy.init_node('depth_proc')

    depth_sensor = None
    try:
    	depth_sensor = ms5837.MS5837(1)  # Initialize sensor on i2c bus 1
    	depth_sensor.init()  # Initializes with density of freshwater
    except:

        pass
    
    pub = rospy.Publisher('depth',
                          Float32, queue_size=10)

    rate = rospy.Rate(10)  # 10hz
    # TODO: I2C related activities
    while not rospy.is_shutdown():
       try:	
           depth_sensor.read() #allows the sensor to read new data
           depth = depth_sensor.depth()
	 
       except:
           depth = 0
       pub.publish(Float32(depth))
       rate.sleep()
