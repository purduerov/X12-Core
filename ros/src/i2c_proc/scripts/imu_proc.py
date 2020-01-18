#! /usr/bin/python
import rospy
import smbus
from BNO055 import BNO055
from shared_msgs.msg import imu_msg
from std_msgs.msg import Bool
PITCH_OFFSET = 0.0
ROLL_OFFSET = 0.0
YAW_OFFSET = 0.0
class dummyIMU():
    def __init__(self):
        pass
    @property
    def data(self):
        return_data = {
            'euler': {
                # Resolution found from a forumn post
                'yaw': 0,  # Rotation about z axis (vertical) +/- 0.01 degree
                'roll': 0,  # Rotation about y axix (perpindicular to the pins IMU) +/- 0.01 degree
                'pitch': 0,  # Rotation about x axis (parallel to the pins of IMU) +/- 0.01 degree

            },
            'gyro': {
                'x': 0,  # 3e-2 degree/sec
                'y': 0,  # 3e-2 degree/sec
                'z': 0,  # 3e-2 degree/sec
            },
            'acceleration': {
                'x': 0,  # +/- 5e-4 g
                'y': 0,  # +/- 5e-4 g
                'z': 0,  # +/- 5e-4 g
            },
            'linear_acceleration': {
                'x': 0,  # +/- 0.25 m/s^2
                'y': 0,  # +/- 0.25 m/s^2
                'z': 0,  # +/- 0.25 m/s^2
            },
            'temp': 0,  # Good enough
        }
#try:

#except:
#    print "no sensor found"
#    imu = dummyIMU();



def _reset_imu(msg):
    global imu
    global PITCH_OFFSET
    global ROLL_OFFSET
    global YAW_OFFSET
    print "message recieved"
    if msg.data:
        PITCH_OFFSET = imu.pitch();
        ROLL_OFFSET = imu.roll();
        YAW_OFFSET = imu.yaw();


if __name__ == "__main__":
    global imu
    rospy.init_node('imu_proc')
    imu = BNO055()
    # Publish to the CAN hardware transmitter
    pub = rospy.Publisher('imu', imu_msg,
                          queue_size=1)

    sub = rospy.Subscriber('reset_imu', Bool,
                           _reset_imu)

    rate = rospy.Rate(50)  # 10hz
    while not rospy.is_shutdown():
        if imu.update():
            out_message = imu_msg()
            imu_data = imu.data
            out_message.gyro = [imu.pitch() - PITCH_OFFSET, imu.yaw() - YAW_OFFSET, imu.roll() - ROLL_OFFSET]
            out_message.accel = [imu.acceleration_x(), imu.acceleration_y(), imu.acceleration_z()]
            pub.publish(out_message)
    rate.sleep()

