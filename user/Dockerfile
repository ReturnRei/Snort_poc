FROM debian

RUN apt update && apt -y install vim curl python3 iproute2 bind9 curl wget iputils-ping vim arp-scan
COPY ./ucurl.sh /root
WORKDIR /root
CMD ["bash"]