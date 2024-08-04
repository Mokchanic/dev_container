#!/bin/bash

# setup workspace
cd /root/ros_workspace
git clone -b docker_ubuntu22.04 https://github.com/Mokchanic/setup_ubuntu.git
cd setup_ubuntu
./setting_docker_ubuntu22.04.sh
cd ..
rm -rf setup_ubuntu
