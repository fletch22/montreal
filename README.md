# montreal

Set up:

1. Download and install Hashicorp Vagrant.

2. Download and install Oracle VirtualBox

3. Create a script file. 

	init.sh

4. Make it executable:

	 chmod +x init.sh

5. Execute it:

	./init.sh

6. Connect by running:

	vagrant ssh

7. Navigate to /workspaces/docker-mgmt/

8. execute "bundle install"

9. If Ubuntu says it has updates run:
	
	sudo apt-get dist-upgrade

10. The f22deployer user should have been created but a config value needs setting:

	a: Find /etc/ssh/sshd_config

	b: Add the following line:

		AllowUsers f22deployer