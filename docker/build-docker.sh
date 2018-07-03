#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-alarmxpay/alarmxd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/alarmxd docker/bin/
cp $BUILD_DIR/src/alarmx-cli docker/bin/
cp $BUILD_DIR/src/alarmx-tx docker/bin/
strip docker/bin/alarmxd
strip docker/bin/alarmx-cli
strip docker/bin/alarmx-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
