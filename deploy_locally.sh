#!/bin/bash

echo 'Do not forget to change the credentials in hosts.ini'
echo "Kill this process if you haven't changed them"
sleep 8

echo 'This might take over 15 minutes, so curl https://$( cat Starbucks.menu | grep coffee )'

echo 'Updating..'
bash scripts/update.sh
# Install ansible
echo 'Installing Ansible..'
bash scripts/install-ansible.sh
# Start SSH
echo 'Starting SSH..'
systemctl start ssh
systemctl status ssh
# Start deploying
ansible-playbook deploy_kali.yml -i hosts.ini
