#!/bin/bash


######################################################################
# you must install sshpass please run "sudo apt-get install sshpass" #
######################################################################


sshpass -p "raspberry" ssh -o StrictHostKeyChecking=no pi@raspberrypi.local rm -r ros/src; mkdir ros/src;
sshpass -p "raspberry" scp -o StrictHostKeyChecking=no -r ros/launch pi@raspberrypi.local:ros
sshpass -p "raspberry" scp -o StrictHostKeyChecking=no -r ros/src pi@raspberrypi.local:ros
sshpass -p "raspberry" scp -o StrictHostKeyChecking=no ros/piros.sh pi@raspberrypi.local:ros
