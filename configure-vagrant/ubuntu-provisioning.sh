echo 
echo "About to apt-get updgrade ..."
apt-get upgrade -y

# Is this necessary after an upgrade?
echo 
echo "About to update apt-get ..."
apt-get update -y

echo 
echo "About to purge lxs-docker ..."
sudo apt-get purge lxc-docker  -y

echo
echo "About to apt-cache policy docker-engine ..."
apt-cache policy docker-engine

echo 
echo "About to apt-get update again ..."
sudo apt-get update -y

echo 
echo "About to apt-get update again ..."
sudo apt-get install apparmor -y

echo 
echo "About to apt-get update again ..."
sudo apt-get update -y

echo 
echo "About to install docker-engine ..."
sudo apt-get install docker-engine -y

# echo 
# echo "About to install ruby-full ..."
# sudo apt-get install ruby-full -y

echo 
echo "About to apt-get upgrade ..."
apt-get upgrade -y

echo 
echo "About to add docker group ..."
sudo groupadd docker

echo 
echo "About to add user 'vagrant' to 'docker' group ..."
sudo usermod -aG docker vagrant

# echo 
# echo "About to install gem bundler ..."
# sudo gem install bundler

echo
echo "About to install curl ..."
sudo apt-get install curl

echo
echo "About to download rvm signature ..."
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

echo
echo "About to curl rvm ..."
curl -L https://get.rvm.io | bash -s stable

echo 
echo "About to add user 'vagrant' to 'rvm' group ..."
sudo usermod -aG rvm vagrant

echo
echo "About to get rvm requirements ..."
rvm requirements

echo 
echo "About to install ruby ..."
rvm install ruby-2.3.0

echo
echo "About to select ruby version "
rvm use ruby 2.3.0

echo
echo "About to install GEM bundler ..."
gem install bundler

echo
echo "About to append public key to athorized_keys"
cat /home/vagrant/.ssh/mac_id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

echo
echo "Provisioning completed."