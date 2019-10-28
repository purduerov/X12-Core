#! /usr/bin/python
import rospy
from shared_msgs.msg import auto_control_msg, final_thrust_msg, thrust_status_msg, thrust_command_msg
from sensor_msgs.msg import Imu
from std_msgs.msg import Float32
import numpy as np
import Complex_1

desired_p = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
desired_p_unramped = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
locked_dims_list = [False, False, False, False, False, False]
disabled_list = [False, False, False, False, False, False, False, False]
inverted_list = [0, 0, 0, 0, 0, 0, 0, 0]
MAX_CHANGE = .1
#watch dog stuff
last_packet_time = 0.0
is_timed_out = False
#flags to prevent old data
new_auto_data = False
new_pilot_data = False
# timout in ms
WATCHDOG_TIMEOUT = 10

def _pilot_command(comm):
  global desired_p #desired thrust from pilot
  global disabled_list #disabled thrusters
  global inverted_list #inverted thrusters
  global new_pilot_data
  global desired_p_unramped
  print 'new_pilot_data'
  desired_p_unramped = comm.desired_thrust
  disabled_list = comm.disable_thrusters
  inverted_list = comm.inverted
  new_pilot_data = True


def ramp(index):
    if (abs(desired_p_unramped[index] - desired_p[index]) > MAX_CHANGE):
        if (desired_p_unramped[index] - desired_p[index] > 0):
            desired_p[index] += MAX_CHANGE
        else:
            desired_p[index] -= MAX_CHANGE
        return
    else:
        desired_p[index] = desired_p_unramped[index]
        
def on_loop():
    global new_pilot_data
    global new_auto_data
    global is_timed_out
    global last_packet_time
    for i in range(0,6):
      ramp(i)
      desired_thrust_final[i] = desired_p[i]

    print "on_loop p=" + str(new_pilot_data) + " a=" + str(new_auto_data) + " t=" + str(is_timed_out)


    #calculate thrust
    pwm_values = c.calculate(desired_thrust_final, disabled_list, False)
    #invert relevant values
    for i in range(8):
      if inverted_list[i] == 1:
        pwm_values[i] = pwm_values[i] * (-1)

    #assign values to publisher messages for thurst control and status
    tcm = final_thrust_msg()
    # val = float of range(-1, 1)
    # if int8: (val * 127.5) - 0.5 will give range -128 to 127
    # if uint8: (val + 1) * 127.5 will give 0 to 255
    tcm.hfl = int((pwm_values[0] + 1) * 127.5)
    tcm.hfr = int((pwm_values[1] + 1) * 127.5)
    tcm.hbr = int((pwm_values[2] + 1) * 127.5)
    tcm.hbl = int((pwm_values[3] + 1) * 127.5)
    tcm.vfl = int((pwm_values[4] + 1) * 127.5)
    tcm.vfr = int((pwm_values[5] + 1) * 127.5)
    tcm.vbr = int((pwm_values[6] + 1) * 127.5)
    tcm.vbl = int((pwm_values[7] + 1) * 127.5)

    tsm = thrust_status_msg()
    tsm.status = pwm_values
    #publish data
    thrust_pub.publish(tcm)
    status_pub.publish(tsm)

if __name__ == "__main__":
  '''
  Note that this file is only set up for using 8 thrusters.
  '''

  #initialize node and rate
  rospy.init_node('thrust_control')
  rate = rospy.Rate(1) #10 hz

  #initialize subscribers
  comm_sub = rospy.Subscriber('/surface/thrust_command',
      thrust_command_msg, _pilot_command)

  #initialize publishers
  thrust_pub = rospy.Publisher('final_thrust',
      final_thrust_msg, queue_size=10)
  status_pub = rospy.Publisher('thrust_status',
      thrust_status_msg, queue_size=10)

  #define variable for class Complex to allow calculation of thruster pwm values
  c = Complex_1.Complex()
  desired_thrust_final = [0, 0, 0, 0, 0, 0]

  while not rospy.is_shutdown():
    on_loop()
    rate.sleep()
