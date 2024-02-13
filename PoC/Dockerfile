FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y python3 python3-pip
RUN pip3 install scapy 
RUN apt-get install -y iptables libpcap-dev

# Copier le script hello_world.py dans le conteneur
COPY PoC.py /app/PoC.py

# Définir le répertoire de travail
WORKDIR /app

ENV TARGET_VALUE=""
ENV DNS_SERVER=""

# Exécuter le script PoC.py avec les arguments provenant des variables d'environnement
CMD ["python3", "PoC.py", "--target", "$TARGET_VALUE", "--dns_server", "$DNS_SERVER"]