#! /bin/bash

export ROS_IP=192.168.1.3
export ROS_MASTER_URI=http://192.168.1.4:11311
export ROS_HOSTNAME=192.168.1.3
source devel/setup.bash

#echo "|$0| |$1|"

#if [ "$1" == "mock" ] || [ "$1" == "Mock" ]
#then
#	roslaunch launch/run_msurface.launch
#else
#	roslaunch launch/run_surface.launch
#fi

