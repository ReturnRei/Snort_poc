docker build -t re_nginx .
docker run --name re_nginx -d -p 8080:80 re_nginx
docker exec -it re_nginx sh