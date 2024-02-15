FROM kalilinux/kali-rolling
RUN apt update 
RUN apt -y install python3-pip python3-venv vim curl iproute2 bind9 curl wget iputils-ping vim libpcap-dev procps ettercap-text-only arp-scan
RUN pip install scapy
WORKDIR /root
COPY ./poc.py ./runpoc.sh /root/

