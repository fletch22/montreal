#!/bin/bash

VOLUME_DATA_DIR=/var/docker-data/consul/client-1-data

# sudo rm -rf $VOLUME_DATA_DIR

sudo mkdir -p $VOLUME_DATA_DIR
sudo chown -R 100:1000 $VOLUME_DATA_DIR

# Get first interface's IP with internet connectivity.
# IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

# docker run -d --net=host -v $VOLUME_DATA_DIR:/consul/data -e 'CONSUL_LOCAL_CONFIG={"leave_on_terminate": true}' consul agent -bind=$IP 

# -p 58300:8300 -p 58301:8301 -p 58301:8301/udp -p 58302:8302 -p 58302:8302/udp -p 58400:8400 -p 58500:8500 -p 58600:53/udp
docker run -d --name consul-client -v $VOLUME_DATA_DIR:/consul/data  -e 'CONSUL_LOCAL_CONFIG={"leave_on_terminate": true}' consul agent 

# -advertise=$IP1

# The -retry-join parameter specifies the external IP of one other agent in the cluster to use to join 
# at startup. There are several ways to control how an agent joins the cluster, see the agent configuration 
# guide for more details on the -join, -retry-join, and -atlas-join options.
# -retry-join=<root agent ip>