#!/bin/bash

# Create new docker group for non-root users
sudo groupadd docker
# Add the new docker group to the current user
sudo usermod -aG docker $USER
# Activate the new group settings
newgrp docker

# Update file permissions in case previous commands were run with sudo by mistake
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

# Enable auto start on reboot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Create new folder for persistent stat-calc data
sudo mkdir -p /opt/docker/statCalcData

# Create new docker network for containers to share
docker network create comlink
