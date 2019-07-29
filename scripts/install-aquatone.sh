#!/bin/bash
cd /opt/
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
mkdir Aquatone/ && unzip aquatone_linux_amd64_1.7.0.zip && mv LICENSE.txt README.md aquatone Aquatone/ 
rm aquatone_linux_amd64_1.7.0.zip
ln -s /opt/Aquatone/aquatone /sbin/aquatone
