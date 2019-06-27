#!/bin/bash
FILE=/opt/Empire/empire

if [ -f "$FILE" ]; then
    echo "Empire has been installed"
else
	cd /opt
	git clone https://github.com/EmpireProject/Empire.git
	cd Empire
	sed -i -e 's/choice = raw_input/choice="" #/g' setup/setup_database.py
        expect -c 'spawn ./setup/install.sh ; expect "server"; send "\r"; interact'
	ln -s empire /usr/bin/empire
fi
