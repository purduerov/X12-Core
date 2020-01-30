# !/usr/bin/python3
"""Simple gamepad/joystick test example."""

from __future__ import print_function


import inputs
from time import time, sleep
import threading

EVENT_ABB = (
    # Joysticks
    ('Absolute-ABS_X', 'LSX'),
    ('Absolute-ABS_Y', 'LSY'),
    ('Absolute-ABS_RX', 'RSX'),
    ('Absolute-ABS_RY', 'RSY'),

    # Triggers
    ('Absolute-ABS_Z', 'LT'),
    ('Absolute-ABS_RZ', 'RT'),

    #DPad
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
MIN_ABS_DIFFERENCE = 0
TRIGGER_DEAD_ZONE = 50
TRIGGER_RANGE = 550
STICK_DEAD_ZONE = 4000
STICK_RANGE = 32768

class JSTest(object):
    """Simple joystick test class."""
    def __init__(self, gamepad=None, abbrevs=EVENT_ABB):
        self.btn_state = {}
        self.old_btn_state = {}
        self.abs_state = {}
        self.old_abs_state = {}
        self.lastprint = gettime()
        self.extraprint = False
        self.abbrevs = dict(abbrevs)
        for key, value in self.abbrevs.items():
            if key.startswith('Absolute'):
                self.abs_state[value] = 0
                self.old_abs_state[value] = 0
            if key.startswith('Key'):
                self.btn_state[value] = 0
                self.old_btn_state[value] = 0
        self._other = 0
        self.gamepad = gamepad
        if not gamepad:
            self._get_gamepad()

    def _get_gamepad(self):
        """Get a gamepad object."""
        try:
            self.gamepad = inputs.devices.gamepads[0]
        except IndexError:
            raise inputs.UnpluggedError("No gamepad found.")

    def handle_unknown_event(self, event, key):
        """Deal with unknown events."""
        if event.ev_type == 'Key':
            new_abbv = 'B' + str(self._other)
            self.btn_state[new_abbv] = 0
            self.old_btn_state[new_abbv] = 0
        elif event.ev_type == 'Absolute':
            new_abbv = 'A' + str(self._other)
            self.abs_state[new_abbv] = 0
            self.old_abs_state[new_abbv] = 0
        else:
            return None

        self.abbrevs[key] = new_abbv
        self._other += 1

        return self.abbrevs[key]

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
            return 0.0;
        
        raw -= dead_zone;
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

        curtime = gettime()    
        if curtime - self.lastprint > 50:
        # if True:
            self.lastprint = curtime
            self.extraprint = False
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
            self.output_state(event.ev_type, abbv)
            printFinal = threading.Thread(target=self.print_state, args=(50,))
            printFinal.start()          
        else:
            if event.ev_type == 'Key':
                self.btn_state[abbv] = event.state
            if event.ev_type == 'Dpad':
                self.abs_state[abbv] = event.state
            if event.ev_type == 'Absolute':
                self.abs_state[abbv] = self.correct_raw(event.state, abbv)
                # self.abs_state[abbv] = event.state

    def print_state(self, wait=None):
        """Format the state."""
        if wait:
            sleep(wait/1000)
            if gettime() - self.lastprint < 50:
                return


        output_string = ""
        for key, value in self.abs_state.items():
            output_string += key + ':' + '{:>8}'.format(str(value) + ' ')

        for key, value in self.btn_state.items():
            output_string += key + ':' + str(value) + ' '

        print(output_string)
        return

    def output_state(self, ev_type, abbv):
        """Print out the output state."""
        if ev_type == 'Key':
            if self.btn_state[abbv] != self.old_btn_state[abbv]:
                self.print_state()
        else:
            if self.abs_state[abbv] != self.old_abs_state[abbv]:
                self.print_state()

    def process_events(self):
        """Process available events."""
        try:
            events = self.gamepad.read()
        except EOFError:
            events = []
        for event in events:
            self.process_event(event)
        
        
    


def gettime():
    return round(time() * 1000) % 10000000

def main():
    """Process all events forever."""
    
    jstest = JSTest()
    while 1:
        jstest.process_events()


if __name__ == "__main__":
    main()