#!/bin/bash
apt-get update
apt-get install ansible -y
pip install ansible
pip install pywinrm
apt-get install python3-winrm -y
#Extra
apt-get -y install sshpass
