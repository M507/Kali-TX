#!/bin/bash
git clone https://github.com/1N3/BlackWidow.git  /opt/BlackWidow
cd  /opt/BlackWidow
cp blackwidow /usr/bin/blackwidow
cp injectx.py /usr/bin/injectx.py
pip install -r requirements.txt
