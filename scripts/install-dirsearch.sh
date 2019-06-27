#!/bin/bash
FILE=/opt/dirsearch/dirsearch.py
if [ -f "$FILE" ]; then
    	echo "$FILE exist"
else
	cd /opt
	git clone https://github.com/maurosoria/dirsearch.git
	cd dirsearch
	ln -s dirsearch.py /usr/bin/dirsearch.py
fi
