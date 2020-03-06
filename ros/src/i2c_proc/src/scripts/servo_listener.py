#!/usr/bin/env python
import rospy
from std_msgs.msg import Float32
import RPi.GPIO as GPIO #imports the standard Raspberry Pi GPIO library
from time import sleep #imports sleep (aka waiting or pause) into the program

#Setting a Pin Mode
GPIO.setmode(GPIO.BOARD) #Chose Board pin number scheme
#Set up pin 11 for PWM
GPIO.setup(11, GPIO.OUT) #sets up pin 11 to an output
p = GPIO.PWM(11,50) #sets up pin 11 as a PWM pin(50 is the frequency)
p.start(0) #starts running PWM on the pin and sets it to 0

def callback(data):
    duty = data/18 + 2.5 #change the angle to desired duty cycle
    p.ChangeDutyCycle(duty) 

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("chatter", Float32, callback)
    rospy.spin() #keeps python from exiting until this node is stopped 

if __name__ == '__main__':
    #subscribe to the can hardware transmitter
    listener()
    
