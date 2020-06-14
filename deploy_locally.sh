#!/bin/bash

echo 'Do not forget to change the credentials in hosts.ini'
echo "Kill this process if you haven't changed them"
sleep 8

# Run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


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

# Fix the source repositories list 
echo "
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb http://kali.cs.nctu.edu.tw/kali kali-rolling main contrib non-free
deb-src http://http.kali.org/kali kali-rolling main non-free contrib
" >> /etc/apt/sources.list


# Deploy
echo 'Updating..'
bash scripts/update.sh
# Install ansible
echo 'Installing Ansible..'
bash scripts/install-ansible.sh
# Start SSH
echo 'Starting SSH..'
systemctl start ssh
# Start deploying
ansible-playbook deploy_kali.yml -i hosts.ini -e 'ansible_python_interpreter=/usr/bin/python3'


# If you are deplying it with the root user
if [[ $string2 == *"root"* ]]; then
	if [[ $string1 == *"yes"* ]]; then
  		echo "All set. Hack the planet!"
	else
		echo "Recovering "$sshd ".."
		# Recover the old sshd_config file
		mv $sshd.bk $sshd
	fi
fi
