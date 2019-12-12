#!/bin/bash

echo 'Do not forget to change the credentials in hosts.ini'
echo "Kill this process if you haven't changed them"
sleep 8

echo 'This might take over 15 minutes, so curl https://$( cat Starbucks.menu | grep coffee )'


sshd='/etc/ssh/sshd_config'
string1=$(cat $sshd | grep PermitRootLogin )
string2=$(cat hosts.ini | grep ansible_user=root)

# If you are deplying it with the root user
if [[ $string2 == *"root"* ]]; then
	echo "Checking "$sshd ".. "
	if [[ $string1 == *"yes"* ]]; then
  		echo "SSH configuration is all set."
	else
  		echo "PermitRootLogin is disabled"
  		echo "Backing up "$sshd ".."
		cp $sshd $sshd.bk
  		echo "Modifying "$sshd ".."
  		sed 's/PermitRootLogin/PermitRootLogin yes#/' $sshd.bk > $sshd
		systemctl restart ssh
	fi
fi


# Deploy
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


# If you are deplying it with the root user
if [[ $string2 == *"root"* ]]; then
	echo "Recovering "$sshd ".."
	# Recover the old sshd_config file
	mv $sshd.bk $sshd
fi
