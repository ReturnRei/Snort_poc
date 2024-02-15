### run source ./runpoc.sh 
# Don't #!/bin/bash
# Sourcing allows the venv etc to be setup

python3 -m venv scapyenv
source ./scapyenv/bin/activate
pip install scapy
echo "now running"
echo "python3 poc.py -t 172.20.0.4 -r 172.20.0.50"
sleep 1
python3 poc.py -t 172.20.0.4 -r 172.20.0.50

#3 nginx 
# 1 /home/snorty/snort3/bin/snort -c /home/snorty/snort3/etc/snort/snort.lua -R /home/snorty/ffs.rules -A alert_full -i eth0
# 2 laisse ouver tu peu rien faire dessus
# 3 tu poura executer cmd comme arp -a
#1 attaquante source runpoc.sh
#1 user curl 172.20.0.4
