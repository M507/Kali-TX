#!/bin/bash
FILE=/opt/rpivot/server.py

if [ -f "$FILE" ]; then
    echo "Rpivot has been cloned"
else
	git clone https://github.com/klsecservices/rpivot.git
fi
