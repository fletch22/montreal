#!/bin/bash


# Consul Setup
export CONSUL_SHARED_DIR=/var/docker-data/consul/server-1-data

# Consul IP
export PUBLIC_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
export BRIDGE_IP=$(ip addr | awk '/inet/ && /docker0/{sub(/\/.*$/,"",$2); print $2}')

sudo mkdir -p $CONSUL_SHARED_DIR
sudo chown -R 100:1000 $CONSUL_SHARED_DIR

# nginx Setup
export NGINX_SHARED_DIR=/var/docker-data/nginx/content

sudo rm -rf $NGINX_SHARED_DIR/index.html
sudo mkdir -p $NGINX_SHARED_DIR

sudo cp ../nginx/index.html $NGINX_SHARED_DIR

export NGINX_CONF_DIR=/var/docker-data/nginx/content

sudo rm -rf $NGINX_CONF_DIR/nginx.conf
sudo mkdir -p $NGINX_CONF_DIR

sudo cp ../nginx/nginx.conf $NGINX_CONF_DIR

echo "Using BRIDGE_IP $BRIDGE_IP"

# Environment variables are used automatically by docker-compose.yml file.
docker-compose up