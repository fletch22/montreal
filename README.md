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

## Lifecyle Plan #1

1st Deploy:

	Remove all containers and images

	Run docker volume container create script.

	Run docker-compose.

nth Redeploy

	Data Volumes Reguire No Data Migration:

		Stop and remove docker-compose containers

		Import tarred containers.

		Run docker-compose up.

	Data Volumes Reguire Data Migration:

		At PROD: 

			Stop and tar up data volumes.

			Ship back to development

		At DEV: 

			Test/Develop migration scripts against volumes from prod.

			Package Migration Scripts with Deploy Pod.

			Ship Deploy Pod to PROD

		At PROD: 

			Close to public.

			Stop and remove docker-compose containers

			Import Deploy Pod containers.

			Run docker-compose up.

			Run migration script.

			Open to public.

Periodic Maintenance:

	Type 1 Backup And Restore:

		Backup

			Stop The Container(s)

			Run Docker Export on containers with 

			Back Up Data Containers

				# See https://docs.docker.com/engine/tutorials/dockervolumes/#backup-restore-or-migrate-data-volumes

				Example:
				docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata

			Copy backup to backup location.

			Re-start container(s)

		Restoring

			Create the new container from the image. Perhaps like so:

				docker run -v /dbdata --name dbstore2 ubuntu /bin/bash

			Execute the restore

				docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"

	Type 2 Backup and Restore:

		Setup: Store volumes on host -- not in containers

		Backup: 

			Turn off consuming guest(s).

			Tar up the folder.

			Restart container

		Restore:

			Stop the container.

			Delete the physical volume

			Recreate the physical volume folder with the backed up one.

Useful docker commands:

Remove all containers: 

docker rmi $(docker images -q --filter "dangling=true")

Run a command in a container

sudo docker exec -i -t nginx-f22 /bin/bash










