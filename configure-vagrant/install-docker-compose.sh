#!/bin/bash

DOCKER_COMPOSE_PATH=/usr/local/bin

sudo mkdir -p $DOCKER_COMPOSE_PATH

DOCKER_COMPOSE_FILE=$DOCKER_COMPOSE_PATH/docker-compose

sudo touch $DOCKER_COMPOSE_FILE

sudo curl -o $DOCKER_COMPOSE_FILE -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` 

sudo chmod +x $DOCKER_COMPOSE_FILE