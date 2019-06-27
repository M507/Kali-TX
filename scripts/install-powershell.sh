#!/bin/bash
wget http://ftp.us.debian.org/debian/pool/main/i/icu/libicu57_57.1-6+deb9u2_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/i/icu/icu-devtools_57.1-6+deb9u2_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/u/ust/liblttng-ust0_2.9.0-2+deb9u1_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/libu/liburcu/liburcu4_0.9.3-1_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/u/ust/liblttng-ust-ctl2_2.9.0-2+deb9u1_amd64.deb

dpkg -i liburcu4_0.9.3-1_amd64.deb 
dpkg -i liblttng-ust-ctl2_2.9.0-2+deb9u1_amd64.deb
dpkg -i liblttng-ust0_2.9.0-2+deb9u1_amd64.deb
dpkg -i libicu57_57.1-6+deb9u2_amd64.deb
dpkg -i icu-devtools_57.1-6+deb9u2_amd64.deb
# Install
apt update && apt -y install curl gnupg apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/powershell.list
apt update -y
apt -y install powershell
# In case
apt --fix-broken install
apt -y install powershell
