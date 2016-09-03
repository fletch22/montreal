#!/bin/bash

# Docker Data Container

docker create -v /nexus-data --name nexus-data sonatype/nexus3 /bin/true