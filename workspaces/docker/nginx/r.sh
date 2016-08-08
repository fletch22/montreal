#!/bin/bash

# docker run --name some-content-nginx -t some-content-nginx 

SHARED_VOL_DIR=/var/docker-data/nginx/

sudo rm -rf $NEXUS_DATA_DIR/index.html
sudo mkdir -p $SHARED_VOL_DIR

sudo cp ./index.html $SHARED_VOL_DIR

docker run --name nginx-f22 --net=host -v $SHARED_VOL_DIR:/usr/share/nginx/html:ro -d nginx-f22