#!/bin/bash
docker compose down
docker compose build 
docker compose up -d 
services=$(docker-compose config --services | grep -v 'pihole')
docker compose logs -f $services