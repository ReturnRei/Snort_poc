### run source ./runpoc.sh 
# Don't #!/bin/bash
# Sourcing allows the venv etc to be setup

python3 -m venv scapyenv
source ./scapyenv/bin/activate
pip install scapy
echo "now running"
echo "python3 poc.py -t 172.20.0.4 -r 172.20.0.50"
sleep 1
#python3 poc.py -t 172.20.0.4 -r 172.20.0.50
python3 poctemp.py