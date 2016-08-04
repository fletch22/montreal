#!/bin/bash

VOLUME_DATA_DIR=/var/docker-data/consul/server-1-data

sudo mkdir -p $VOLUME_DATA_DIR
sudo chown -R 100:1000 $VOLUME_DATA_DIR

# Get first interface's IP with internet connectivity.
IP1=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

echo "IP $IP1 will be used to bind arg."

echo $IP1

IP2=127.0.0.1

# -p 53:8600/tcp -p 53:8600/udp
# --net=host
# --restart=always 
# docker run -d -v $VOLUME_DATA_DIR:/consul/data -p 58500:8500  -p 8300:8300 -e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' consul agent -server -bootstrap -ui -bind=$IP2 -advertise=$IP1

# -v $VOLUME_DATA_DIR:/consul/data
# -data-dir=$VOLUME_DATA_DIR/data -config-dir=$VOLUME_DATA_DIR/config
docker run -d  -p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:53/udp -e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' consul agent -server -advertise=$IP1 -bootstrap -client 0.0.0.0 

# '-bootstrap-expect'
# Number of servers to wait for before joining startup cluster. Helps control ordering.
# Example: -bootstrap-expect:0 (expect zero and be the first to start up)

# 'retry-join'
# Use in multi agent environment
# Example: -retry-join=<root agent ip>