#! /usr/bin/python
import rospy
import smbus
import math
from BNO055 import BNO055
from shared_msgs.msg import imu_msg
from std_msgs.msg import Bool
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
#try:

#except:
#    print "no sensor found"
#    imu = dummyIMU();



def reset_imu_offsets():
    global imu
    global IMU_PITCH_OFFSET
    global IMU_ROLL_OFFSET
    global IMU_YAW_OFFSET
    print "message recieved"
    IMU_PITCH_OFFSET = imu.pitch();
    IMU_ROLL_OFFSET = imu.roll();
    IMU_YAW_OFFSET = imu.yaw();
    print ("imu_pitch offset" , IMU_PITCH_OFFSET)

#bind all angles to -180 to 180
def clamp_angle_neg180_to_180(angle):
    angle_0_to_360 = clamp_angle_0_to_360(angle)
    if angle_0_to_360 > 180:
        return angle_0_to_360 - 180 * -1.0
    return angle_0_to_360
#bind all angles to -180 to 180
def clamp_angle_0_to_360(angle):
    return (angle + 1* 360) - math.floor((angle + 2 * 360)/360)*360

if __name__ == "__main__":
    global imu
    rospy.init_node('imu_proc')
    imu = BNO055()
    # Publish to the CAN hardware transmitter
    pub = rospy.Publisher('imu', imu_msg,
                          queue_size=1)

    #sub = rospy.Subscriber('reset_imu', Bool,
    #                       _reset_imu_offsets)
    
    rate = rospy.Rate(50)  # 10hz
    firstTime = 1000 
    while not rospy.is_shutdown():
        if imu.update():
            out_message = imu_msg()
            imu_data = imu.data
            #if firstTime>0:
            #    firstTime -= 1
            #    IMU_ROLL_OFFSET = imu.roll()
            #    IMU_YAW_OFFSET = imu.yaw()
            #    IMU_PITCH_OFFSET = imu.pitch()
            #convert everything to a 0 to 360 to apply a 1d rotation then convert back to -180 to 180
            ROV_Pitch = clamp_angle_0_to_360(imu.roll()) - IMU_ROLL_OFFSET;
            ROV_Roll = clamp_angle_0_to_360(imu.yaw()) - IMU_YAW_OFFSET;
            ROV_Yaw = clamp_angle_0_to_360(imu.pitch()) - IMU_PITCH_OFFSET;
           # out_message.gyro = [ROV_Pitch, ROV_Roll, ROV_Yaw]
            out_message.gyro = [imu.roll(),imu.yaw(),imu.pitch()]
            ROV_X_Accel = imu.acceleration_z();
            ROV_Y_Accel = imu.acceleration_x();
            ROV_Z_Accel = imu.acceleration_y();
            out_message.accel = [ROV_X_Accel, ROV_Y_Accel, ROV_Z_Accel]
            pub.publish(out_message)
    rate.sleep()

