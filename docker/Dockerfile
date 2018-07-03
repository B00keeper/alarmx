FROM debian:stretch
LABEL maintainer="Alarmx Developers <dev@alarmx.io>"
LABEL description="Dockerised AlarmxCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
