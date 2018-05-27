#!/bin/bash
echo -e "[Docker]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/6/
enabled=1
gpgcheck=0
gpgkey=https://yum.dockerproject.org/pgp
" > /etc/yum.repos.d/docker.repo
yum update -y
yum install -y docker-engine
systemctl enable docker

docker pull registry.cn-beijing.aliyuncs.com/tcm/ulord
docker run -d --restart=always --name test registry.cn-beijing.aliyuncs.com/tcm/ulord
