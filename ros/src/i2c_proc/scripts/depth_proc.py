#! /usr/bin/python
import rospy
# import ms5837
import ms5837
from std_msgs.msg import Float32

if __name__ == "__main__":
    rospy.init_node('depth_proc')

    depth_sensor = None
    # try:
    depth_sensor = ms5837.MS5837(1)  # Initialize sensor on i2c bus 1
    depth_sensor.init()  # Initializes with density of freshwater
   # except:

    #    pass

    pub = rospy.Publisher('depth',
                          Float32, queue_size=10);

    rate = rospy.Rate(10)  # 10hz
    # TODO: I2C related activities
    while not rospy.is_shutdown():
       # try:
       	 depth = depth_sensor.depth()
	 depth_sensor.read() #NEED THIS STATEMENT to actually update the values
#	 if depth_sensor.read():
	 print("P: %0.1f mbar  %0.3f psi\tT: %0.2f C  %0.2f F") % (
         depth_sensor.pressure(), # Default is mbar (no arguments)
	 depth_sensor.pressure(ms5837.UNITS_psi), # Request psi
         depth_sensor.temperature(), # Default is degrees C (no arguments)
         depth_sensor.temperature(ms5837.UNITS_Farenheit)) # Request Farenheit
       
 #        else:
#	       	 print("Sensor read failed :(")
	# except:
       #     depth = 0
         pub.publish(Float32(depth))
         rate.sleep()
