FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y
# begin base install
RUN apt-get install -y valgrind procps iproute2 bind9 curl wget iputils-ping vim
# end   base install
RUN apt-get install -y python3 python3-pip
RUN pip3 install scapy 
RUN apt-get install -y iptables libpcap-dev

# Copier le script hello_world.py dans le conteneur
COPY PoC.py /app/PoC.py

# Définir le répertoire de travail
WORKDIR /app
