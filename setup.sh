#!/bin/bash
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce

service docker start

systemctl enable docker

docker pull registry.cn-beijing.aliyuncs.com/tcm/aro-java

docker run -d --restart=always --name test -e cpus="`cat /proc/cpuinfo |grep "processor"|sort |uniq|wc -l`" registry.cn-beijing.aliyuncs.com/tcm/aro-java