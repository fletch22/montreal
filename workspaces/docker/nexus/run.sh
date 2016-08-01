#!/bin/bash

NEXUS_DATA_DIR=/var/docker-data/nexus/nexus-data

sudo rm -rf $NEXUS_DATA_DIR
sudo mkdir -p $NEXUS_DATA_DIR
sudo chown -R 200:200 $NEXUS_DATA_DIR

docker run -td -p 58081:8081 -v $NEXUS_DATA_DIR:/nexus-data --restart=always --name nexus sonatype/nexus3

