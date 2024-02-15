#!/bin/sh

# Start your Python script in the background
python3 /root/poctemp.py &
sleep 3
# Start nginx with valgrind
exec valgrind nginx -g "daemon off;"