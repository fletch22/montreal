#!/bin/bash

DOCKER_SHARE_DIR=/var/docker-data

# Consul Setup
export CONSUL_SHARED_DIR=$DOCKER_SHARE_DIR/consul/server-1-data

# Consul IP
export PUBLIC_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
export BRIDGE_IP=$(ip addr | awk '/inet/ && /docker0/{sub(/\/.*$/,"",$2); print $2}')

echo "Public IP: $PUBLIC_IP"
echo "Bridge IP: $BRIDGE_IP"

sudo mkdir -p $CONSUL_SHARED_DIR
sudo chown -R 100:1000 $CONSUL_SHARED_DIR

# nginx Setup
export NGINX_SHARED_DIR=$DOCKER_SHARE_DIR/nginx

NGINX_CONTENT_DIR=$NGINX_SHARED_DIR/html

sudo rm -rf $NGINX_CONTENT_DIR/index.html
sudo mkdir -p $NGINX_CONTENT_DIR

sudo cp ../nginx/index.html $NGINX_CONTENT_DIR

export NGINX_CONFIG_DIR=$NGINX_SHARED_DIR/conf
sudo mkdir -p $NGINX_CONFIG_DIR

sudo rm -rf $NGINX_CONFIG_DIR/f22.conf
sudo cp ../nginx/conf/f22.conf $NGINX_CONFIG_DIR

sudo rm -rf $NGINX_CONFIG_DIR/nginx.conf
sudo cp ../nginx/conf/nginx.conf $NGINX_CONFIG_DIR

# Chown with the userid:groupId of the container's nginx user.
sudo chown -R 100:101 $NGINX_CONFIG_DIR

export NEXUS_URI=http://$PUBLIC_IP:58081/repository/npm-proxy/

echo "Using BRIDGE_IP $BRIDGE_IP"