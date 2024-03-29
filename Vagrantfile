 # -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # config.ssh.private_key_path = "~/.ssh/id_rsa"
  # config.ssh.forward_agent = true

  # config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"

  # F22Website NodeJs Container
  config.vm.network "forwarded_port", guest: 58888, host: 58888

    # F22Website NodeJs Container
  config.vm.network "forwarded_port", guest: 82, host: 50082

  # Nginx Reverse Proxy
  config.vm.network "forwarded_port", guest: 80, host: 50080

  # Nexus Container
  config.vm.network "forwarded_port", guest: 58081, host: 58081

  # Consul Container
  config.vm.network "forwarded_port", guest: 8500, host: 8500

  # config.vm.network "forwarded_port", guest: 53, host: 53

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Helps overcome permission errors when we try to create/delete/modify folders/files under
  # the synced_folder with a non-vagrant user; to make this truly work add the user to the
  # vagrant *group*.
  config.vm.synced_folder "./", "/vagrant", id: "vagrant",
    :owner => "vagrant",
    :group => "vagrant",
    :mount_options => ["dmode=775,fmode=775"]

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"

    # http://askubuntu.com/questions/238040/how-do-i-fix-name-service-for-vagrant-client
    # vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
  
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  config.vm.provision "file", source: "~/.ssh/remote-deploy.pub", destination: "/vagrant/configure-vagrant/remote-deploy.pub"
  config.vm.provision "shell", path: "configure-vagrant/ubuntu-provisioning.sh"
end
