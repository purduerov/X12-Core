#!/usr/bin/env python3
# license removed for brevity
from __future__ import print_function

import rospy
from std_msgs.msg import String
import json
from shared_msgs.msg import controller_msg

import inputs
from time import time, sleep
import threading
import json
import os

EVENT_ABB = (
    # Joysticks
    ('Absolute-ABS_X', 'LSX'),
    ('Absolute-ABS_Y', 'LSY'),
    ('Absolute-ABS_RX', 'RSX'),
    ('Absolute-ABS_RY', 'RSY'),

    # Triggers
    ('Absolute-ABS_Z', 'LT'),
    ('Absolute-ABS_RZ', 'RT'),

    # DPad
    ('Absolute-ABS_HAT0X', 'DPADX'),
    ('Absolute-ABS_HAT0Y', 'DPADY'),

    # Face Buttons
    ('Key-BTN_NORTH', 'Y'),
    ('Key-BTN_EAST', 'B'),
    ('Key-BTN_SOUTH', 'A'),
    ('Key-BTN_WEST', 'X'),

    # Other buttons
    ('Key-BTN_THUMBL', 'LSZ'),
    ('Key-BTN_THUMBR', 'RSZ'),
    ('Key-BTN_TL', 'LB'),
    ('Key-BTN_TR', 'RB'),
    ('Key-BTN_MODE', 'XBOX'),
    ('Key-BTN_START', 'START'),
    ('Key-BTN_SELECT', 'MENU'),
)


# This is to reduce noise from the PlayStation controllers
# For the Xbox controller, you can set this to 0
UPDATE_INTERVAL = 50
MIN_ABS_DIFFERENCE = 0
TRIGGER_DEAD_ZONE = 50
TRIGGER_RANGE = 550
STICK_DEAD_ZONE = 4000
STICK_RANGE = 32768

# actions
PRINT = 'PRINT'
SEND = 'SEND'
stop_threads = False

class GamepadTest(object):
    """Simple joystick test class."""

    def __init__(self, gamepad=None, abbrevs=EVENT_ABB, action=PRINT):
        self.action = action
        self.print_thread = None
        self.btn_state = {}
        self.old_btn_state = {}
        self.abs_state = {}
        self.old_abs_state = {}
        self.lastprint = self.get_time()
        self.finalprint = False
        self.abbrevs = dict(abbrevs)
        for key, value in self.abbrevs.items():
            if key.startswith('Absolute') and not 'DPAD' in value:
                self.abs_state[value] = 0.0
                self.old_abs_state[value] = 0.0
            elif key.startswith('Key'):
                self.btn_state[value] = 0
                self.old_btn_state[value] = 0
            else:
                self.abs_state[value] = 0
                self.old_abs_state[value] = 0
        self._other = 0
        self.gamepad = gamepad
        if not gamepad:
            self._get_gamepad()

    def get_time(self):
        return round(time() * 1000) % 10000000

    def interval_elapsed(self):
        curtime = self.get_time()
        elapsed = curtime - self.lastprint > UPDATE_INTERVAL
        return elapsed

    def _get_gamepad(self):
        """Get a gamepad object."""
        try:
            self.gamepad = inputs.devices.gamepads[0]
        except IndexError:
            raise inputs.UnpluggedError("No gamepad found.")

    def correct_raw(self, raw, abbv):
        sign = (raw >= 0) * 2 - 1
        raw = abs(raw)

        if abbv[1] == 'T':
            dead_zone = TRIGGER_DEAD_ZONE
            value_range = TRIGGER_RANGE
        else:
            dead_zone = STICK_DEAD_ZONE
            value_range = STICK_RANGE

        if raw < dead_zone:
            return 0.0

        raw -= dead_zone
        raw *= value_range / (value_range - dead_zone)
        raw = 1.0 if raw > value_range else raw / value_range
        corrected = round(raw, 3)
        corrected *= sign
        return corrected

    def process_event(self, event):
        """Process the event into a state."""
        if event.ev_type == 'Sync':
            return
        if event.ev_type == 'Misc':
            return
        key = event.ev_type + '-' + event.code
        try:
            abbv = self.abbrevs[key]
            if (abbv[0] == 'D'):
                event.ev_type = 'Dpad'
        except KeyError:
            return

        if self.interval_elapsed():
            self.lastprint = self.get_time()
            if event.ev_type == 'Key':
                self.old_btn_state[abbv] = self.btn_state[abbv]
                self.btn_state[abbv] = event.state
            if event.ev_type == 'Dpad':
                self.old_abs_state[abbv] = self.abs_state[abbv]
                self.abs_state[abbv] = event.state
            if event.ev_type == 'Absolute':
                self.old_abs_state[abbv] = self.abs_state[abbv]
                self.abs_state[abbv] = self.correct_raw(event.state, abbv)
                # self.abs_state[abbv] = event.state

            return self.output_state(event.ev_type, abbv)

        else:
            if event.ev_type == 'Key':
                self.btn_state[abbv] = event.state
            if event.ev_type == 'Dpad':
                self.abs_state[abbv] = event.state
            if event.ev_type == 'Absolute':
                self.abs_state[abbv] = self.correct_raw(event.state, abbv)
                # self.abs_state[abbv] = event.state

    def do_action(self):
        # if thread:
        #     print('aaaaaaa')
        #     while True:
        #         if stop():
        #             break
        #         if get_time()
        #         self.lastprint = self.get_time()

        if self.action == PRINT:
            self.print_state()
        elif self.action == SEND:
            combined = {**self.abs_state, **self.btn_state}
            print(json.dumps(combined))

    def print_state(self):
        """Format the state."""

        output_string = ""
        for key, value in self.abs_state.items():
            output_string += key + ':' + '{:>7}'.format(str(value) + ' ')

        for key, value in self.btn_state.items():
            output_string += key + ':' + str(value) + ' '

        print(output_string)
        return

    def output_state(self, ev_type, abbv):
        """Print out the output state."""
        if ev_type == 'Key':
            if self.btn_state[abbv] != self.old_btn_state[abbv]:
                self.do_action()
                return True
        else:
            if self.abs_state[abbv] != self.old_abs_state[abbv]:
                self.do_action()
                return True

def talker():
    pub = rospy.Publisher('chatter', String, queue_size=10)
    rospy.init_node('gp_pub', anonymous=True)
    gptest = GamepadTest(action=SEND)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        #hello_str = "hello world %s" % rospy.get_time()
        #rospy.loginfo(hello_str)
        #pub.publish(hello_str)
        #rate.sleep()

        try:
            events = gptest.gamepad.read()
        except EOFError:
            events = []
        for event in events:
            gptest.process_event(event)
    
        stuff = gptest.btn_state
        stuff.update(gptest.abs_state)
        rospy.loginfo(stuff)
        pub.publish(json.dumps(stuff))

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass