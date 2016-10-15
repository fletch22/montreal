#!/bin/bash

docker stop nginx-f22

docker rm nginx-f22

docker build -t nginx-f22 .