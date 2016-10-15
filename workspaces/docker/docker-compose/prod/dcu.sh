#!/bin/bash

source ./dci.sh

# docker rm consul-server-f22
# docker rm registrator-f22
# docker rm nginx-f22
# docker rmi -f nginx-f22

# Environment variables are used automatically by docker-compose.yml file.
docker-compose --file docker-compose-prod.yml up # --build # -d