#!/bin/bash

# install Docker
printf '\nAbout to get https transport and ca-certificates ...'
sudo apt-get install apt-transport-https ca-certificates

printf '\n About to install key for connecting to docker(?) server ...'
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

printf 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list

printf "\nAbout to purge lxs-docker ..."
sudo apt-get purge lxc-docker  -y

printf "\nAbout to apt-cache policy docker-engine ..."
apt-cache policy docker-engine -y

printf "\nAbout to apt-get update again ..."
sudo apt-get update -y

printf "\nAbout to apt-get update again ..."
sudo apt-get install apparmor -y

printf "\nAbout to apt-get update again ..."
sudo apt-get update -y

printf "\nAbout to install docker-engine ..."
sudo apt-get install docker-engine -y

printf "\nAbout to apt-get upgrade ..."
apt-get upgrade -y

printf "\nAbout to add 'docker' group ..."
sudo groupadd docker

printf "\nAbout to install Docker Compose ..."
source /vagrant/workspaces/configure-vagrant/install-docker-compose.sh

printf '\nFinished adding docker.\n'