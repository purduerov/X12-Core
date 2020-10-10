#! /bin/bash

source ros/devel/setup.bash

#~/ros/src/can_com/scripts/start_can.sh

#mjpg_streamer -o "output_http.so -w ./www" -i "input_raspicam.so -fps 30" > ~/mjpeg.log &

# ./reset_can.py &

roslaunch ros/launch/run_rov.launch &
python ros/src/roslib_comm/scripts/gamepad_listener.py &
# killall reset_can.py
