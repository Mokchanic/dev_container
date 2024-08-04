FROM osrf/ros:humble-desktop-full

SHELL [ "/bin/bash" , "-c" ]

RUN echo 'export TERM=xterm-256color' >> /root/.bashrc && \
    echo 'PS1="\[\e[32m\]\u@\h \[\e[34m\]\w \[\e[36m\](mw_per)\$\[\e[m\] "' >> /root/.bashrc && \
    echo '' >> /root/.bashrc

# Upgrade all packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get -y install net-tools iputils-ping
RUN apt-get -y install vim
RUN apt-get -y install htop

RUN echo 'set number' >> /etc/vim/vimrc

# Create overlay workspace
WORKDIR /root/ros_workspace

# COPY packages.repos .
# RUN vcs import < packages.repos; \
#     cd ..; \
#     rosdep install --from-paths src --ignore-src -r -y; \
#     source /opt/ros/${ROS_DISTRO}/setup.bash; \
#     colcon build;

COPY workspace_setup.sh .

# Add sourcing ROS setup.bash to .bashrc
RUN echo "" >> ~/.bashrc && echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

RUN cd .. && rm -rf build install log

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
