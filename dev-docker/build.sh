#!/bin/sh

mkdir /home/minikube/workspace
minikube start --mount-string="/home/minikube/workspace:/workspace"

docker build . -f Dockerfile \
	--build-arg ENV_ENVIRONMENT_TARGET=$ENV_ENVIRONMENT_TARGET \
	--build-arg ENV_CONSUL_HOST=$ENV_CONSUL_HOST \
	--build-arg ENV_CONSUL_PORT=$ENV_CONSUL_PORT \
	--build-arg PATH=$PATH \
	--build-arg GOPROXY=$GOPROXY -t catwo/devtest
