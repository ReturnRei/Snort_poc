FROM nginx:1.20.0-alpine
RUN apk add vim python3
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./poc.py /tmp/poc.py
EXPOSE 80
