#!/bin/bash

python3 -m venv scapyenv
source ./scapyenv/bin/activate
pip install scapy
echo "now run"
echo "python3 poc.py -t 172.20.0.4 -r 172.20.0.50"