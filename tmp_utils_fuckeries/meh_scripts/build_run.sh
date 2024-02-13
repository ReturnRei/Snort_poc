docker build -t victim_nginx .
if [ $(docker ps -aq -f name=^victim_nginx$) ]; then
    docker rm -f victim_nginx
fi
docker run --name victim_nginx -d -p 8080:80 victim_nginx