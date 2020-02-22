#! /usr/bin/python
import rospy
import board
import busio
from shared_msgs.msg import imu_msg
from std_msgs.msg import Bool
import adafruit_fxos8700
import adafruit_fxas21002c

IMU_PITCH_OFFSET = 0.0
IMU_ROLL_OFFSET = 0.0
IMU_YAW_OFFSET = 0.0
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

if __name__ == "__main__":
    global accelerometer
    global gyroscope
    rospy.init_node('imu_proc2')

    i2c = busio.I2C(board.SCL, board.SDA)
    accelerometer = adafruit_fxos8700.FXOS8700(i2c)
    gyroscope = adafruit_fxas21002c.FXAS21002C(i2c)

    pub = rospy.Publisher('imu', imu_msg,
                          queue_size=1)

    rate = rospy.Rate(50)

    while not rospy.is_shutdown():
        # TODO: only publish on update, if possible
        out_message = imu_msg()
        ROV_X_Accel, ROV_Y_Accel, ROV_Z_Accel = accelerometer.accelerometer
        out_message.accel = [ROV_X_Accel, ROV_Y_Accel, ROV_Z_Accel]

        ROV_Roll, ROV_Pitch, ROV_Yaw = gyroscope.gyroscope
        ROV_Roll = clamp_angle_0_to_360(ROV_Roll) - IMU_YAW_OFFSET;
        ROV_Pitch = clamp_angle_0_to_360(ROV_Pitch) - IMU_ROLL_OFFSET;
        ROV_Yaw = clamp_angle_0_to_360(ROV_Yaw) - IMU_PITCH_OFFSET;
        out_message.gyro = [ROV_Roll, ROV_Pitch, ROV_Yaw] # TODO: figure out order later

        pub.publish(out_message)
        rate.sleep()

