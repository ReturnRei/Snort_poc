# Utiliser l'image officielle de Nginx avec la version 1.18
FROM nginx:1.20
RUN apt update
# begin base install
RUN apt-get install -y valgrind procps iproute2 bind9 curl wget iputils-ping vim 
# end   base install
# RUN valgrind --version
# Copier le fichier de configuration personnalisé dans le conteneur
# COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80 pour les connexions HTTP
EXPOSE 80
CMD ["ip a"]
CMD ["valgrind", "--leak-check=full", "--log-file=/valgrind_logs/memcheck.log", "/usr/sbin/nginx", "-g", "daemon off;"]
