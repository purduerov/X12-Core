#!/bin/bash


######################################################################
# you must install sshpass please run "sudo apt-get install sshpass" #
######################################################################


sshpass -p "raspberry" ssh -o StrictHostKeyChecking=no pi@raspberrypi.local rm -r ros; mkdir ros;
sshpass -p "raspberry" scp -o StrictHostKeyChecking=no -r ros/launch pi@raspberrypi.local:ros
sshpass -p "raspberry" scp -o StrictHostKeyChecking=no -r ros/src pi@raspberrypi.local:ros
sshpass -p "raspberry" ssh -o StrictHostKeyChecking=no pi@raspberrypi.local rm -r ros/devel; rm -r ros/build; rm ros/src/CMakeLists.txt; catkin_make -C ros;source ros/devel/setup.bas