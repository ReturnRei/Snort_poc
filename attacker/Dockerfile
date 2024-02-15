FROM kalilinux/kali-rolling
RUN apt update 
RUN apt -y install python3-pip python3-venv vim curl iproute2 bind9 curl wget iputils-ping vim libpcap-dev procps ettercap-text-only arp-scan
RUN apt install iptables dnsutils
WORKDIR /root
COPY newpoc.py ./poctemp.py ./poc.py ./runpoc.sh /root/

