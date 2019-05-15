#!/bin/bash
cd /opt
wget https://download-cf.jetbrains.com/python/pycharm-community-2019.1.2.tar.gz 
tar xvzf pycharm-community-2019.1.2.tar.gz
rm pycharm-community-2019.1.2.tar.gz
ln -s pycharm-community-2019.1.2/bin/pycharm.sh /root/Desktop/pycharm.sh