#!/bin/bash
mkdir -p /opt/Gophish
cd /opt/Gophish
get https://github.com/gophish/gophish/releases/download/0.7.1/gophish-v0.7.1-linux-64bit.zip
unzip gophish-v0.7.1-linux-64bit.zip
rm gophish-v0.7.1-linux-64bit.zip
ln -s gophish /usr/bin/gophish