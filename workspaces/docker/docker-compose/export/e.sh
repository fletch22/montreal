#!/bin/bash

BASEDIR=$(dirname "$0")

cd $BASEDIR

STAGING_PATH=$BASEDIR/staging

function nukeAndPaveDir {
	sudo rm -rf $1
	sudo mkdir -p $1
}

function dockerExport {
	NAME=$1
	printf "\nAbout to export $NAME ...\n"
	docker export $NAME > $STAGING_PATH/$NAME.tar
	printf "\nDone exporting $NAME.\n"
}

printf "\n About to remove previous exported containers ...\n"
nukeAndPaveDir $STAGING_PATH
printf "\nDone removing previously exported containers.\n"

dockerExport webapp-f22
dockerExport consul-server-f22
dockerExport registrator-f22
dockerExport nginx-f22

POD_PATH=$BASEDIR/pods

printf "\n Removing previous pod (if any) ...\n"
nukeAndPaveDir $POD_PATH

printf "\n About to create pod ...\n"
tar -zcvf $POD_PATH/pod.tar.gz $STAGING_PATH

printf "\n Finished export.\n"