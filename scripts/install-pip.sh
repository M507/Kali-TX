#!/bin/bash
apt-get update
cd /tmp
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
