#!/bin/bash
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/updates/*
sudo apt-get update -y
sudo apt-get install ansible -y
sudo pip install ansible
sudo pip install pywinrm
sudo apt-get install python3-winrm -y
#SSH
sudo apt-get -y install sshpass
