Notes

* In the current container NPM is installed by default.


* Authentication Information: 

	Login: admin
	Password: admin123


* To attch to a runningn container:

	docker exec -i -t <containerId> /bin/bash


* Docker events can show what's going on when a container is started. 

	a: Turn on event logging

		docker event&

	b: Execute the docker command.

		The docker event& should output some information about the run attempt. You'll see a container ID 
		at the beginning.

	c: Take the container id and run the following from the command line:

		docker log <containerid>

* Nexus when not run in a container will not save data. Persisting data for Nexus is pretty important.

	Option 1: Use bind mount volume like so:

		docker run -it /vagrant/something/sonatype-work:/sonatype-work nexus

		Unfortunately this will fail sometimes:

			Failure Reason 1: In the container Nexus runs as user 'nexus' (uid=200) with group 'nexus' (gid=200). This users/group must chown the shared folder in the host. But the host has never chowned for 200:200.

			The solution is to go the host. Find the shared folder and run:

				sudo chown -R 200:200 ./some-shared-folder

			Unfortunately this might fail too at this point if 'some-shared-folder' is already a mounted folder inside a Vagrant VM. In other words, ya cannot change the ownership of a VM mounted shared folder. The solution is use a host folder that is not shared with the OS that is hosting Vagrant.

	Option 2: Use a DVC (Data Volume Container).

* Remove all containers command:

	docker rm $(docker ps -a -q)

* Stop all containers command:

	docker stop $(docker ps -a -q)

* Get Dir Size:

	du -hs <folder path>






	
