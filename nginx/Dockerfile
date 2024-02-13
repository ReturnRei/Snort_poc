FROM nginx:1.20.0
RUN apt update && apt install -y vim python3
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
