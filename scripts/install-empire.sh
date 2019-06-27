#!/bin/bash
FILE=/opt/Empire/empire
if [ -f "$FILE" ]; then
    echo "Empire has been installed"
else
	cd /opt
	git clone https://github.com/EmpireProject/Empire.git
	cd Empire
	expect -c 'spawn ./setup/install.sh ; expect "server"; send "\r"; interact'
	ln -s empire /usr/bin/empire
fi
