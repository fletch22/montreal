#!/bin/bash

printf "\nAbout to apt-get updgrade ..."
apt-get upgrade -y

# Is this necessary after an upgrade?# printf 
printf "\nAbout to update apt-get ..."
apt-get update -y

printf '\nAbout to install Docker'
source /vagrant/configure-vagrant/install-docker.sh

printf "\nAbout to add user 'vagrant' to 'docker' group ..."
sudo usermod -aG docker vagrant

# Required by user creation commands
printf '\nInstalling pcregrep'
sudo apt-get install pcregrep

printf "\nAbout to create user"
source /vagrant/configure-vagrant/create-u-and-g.sh

# printf "\nAbout to install curl ..."
# sudo apt-get install curl

# printf "About to download rvm signature ..."
# sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# printf "\nAbout to curl rvm ..."
# curl -L https://get.rvm.io | bash -s stable

# printf "\nAbout to add user 'vagrant' to 'rvm' group ..."
# sudo usermod -aG rvm vagrant

# printf "\nAbout to source rvm to prepare it for execution"
# source /etc/profile.d/rvm.sh

# printf "\nAbout to get rvm requirements ..."
# rvm requirements

# printf "\nAbout to install ruby ..."
# rvm install ruby-2.3.0

# printf "\nAbout to select ruby version "
# rvm use ruby-2.3.0

# printf "\nAbout to install GEM bundler ..."
# gem install bundler


#=========================================
# Install and Configure NodeJs
#
#=========================================

# printf '\nAbout to install nodejs ...'
# sudo apt-get install node -y

# printf '\nAbout to install npm ...'
# sudo apt-get install npm -y

# printf '\nAbout to install nodejs-legacy ...'
# sudo apt-get install nodejs-legacy -y

printf "\nAbout to build and run Nexus container ..."
source /vagrant/workspaces/docker/nexus/build-and-run.sh

printf "Provisioning completed.\n"