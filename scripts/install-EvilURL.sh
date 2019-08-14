#!/bin/bash
FILE=/opt/EvilURL/evilurl-cli.py

if [ -f "$FILE" ]; then
    echo "Rpivot has been cloned"
else
	git clone https://github.com/UndeadSec/EvilURL.git /opt/EvilURL
fi
