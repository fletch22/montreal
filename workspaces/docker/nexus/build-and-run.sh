#!/bin/bash

# Add nexus to localhost.
IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

ENTRY="\n$IP nexus\n"

echo $ENTRY

# So alot is going on here. 'pcregrep' basically searches 
# for the string. If it does NOT find a match the second part appends the string to the file.
# 'pcregrep' is used instead of 'grep' because 'grep' can't handle multiline searches.
# 'printf' is used instead of 'echo' because 'printf' can handle new lines.
# 'sudo tee -a' is called because we have previously invoked the pipe character. The pipe character causes an output redirection. 
# Commands redirected are executed by the shell. Since the shell is running as root and root is not a sudoer 
# we cannot invoke 'sudo.' Calling 'sudo tee' fixes this.
# 127.0.0.1 localhost 
pcregrep -M "$ENTRY" /etc/hosts || printf "$ENTRY" | sudo tee -a  /etc/hosts

NEXUS_DATA_DIR=/var/docker-data/nexus/nexus-data

# sudo rm -rf $NEXUS_DATA_DIR
sudo mkdir -p $NEXUS_DATA_DIR
sudo chown -R 200:200 $NEXUS_DATA_DIR

docker stop nexus-data
docker rm nexus-data

docker stop nexus
docker rm nexus

docker create -v /nexus-data --name nexus-data --restart=always sonatype/nexus3 /bin/true
docker start nexus-data

# docker run -td -p 58081:8081 -v $NEXUS_DATA_DIR:/nexus-data --restart=always --name nexus sonatype/nexus3
docker run -td -p 58081:8081 --volumes-from nexus-data --restart=always --name nexus sonatype/nexus3


