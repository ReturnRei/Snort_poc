FROM nginx:1.20.0
RUN apt update && apt install -y vim python3 iproute2 bind9 curl wget iputils-ping vim htop
RUN apt install -y valgrind procps
RUN rm /etc/nginx/conf.d/default.conf
RUN apt install -y dnsutils 
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./poctemp.py ./startup.sh /root/
EXPOSE 80
RUN chmod +x /root/startup.sh
#RUN ulimit -n 1024
#CMD ["valgrind", "nginx", "-g", "daemon off;"]
CMD ["/root/startup.sh"]