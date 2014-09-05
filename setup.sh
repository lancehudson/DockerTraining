#! /bin/sh

# Install OpenSSH, curl and git
apt-get update
apt-get install openssh-server git

# Install Docker
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# Then import the repository key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Install docker
apt-get update
apt-get install -y lxc-docker
adduser user docker

# Build Docker Images
docker build -t apt-cacher-ng AptCacher
docker build -t npm-lazy NPMLazy


# Install Apt-Cacher-ng - 172.17.42.1:3142
echo 'Acquire::http { Proxy "172.17.42.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy

# Install NPM Lazy

# Install Gitlab

# Install Docker-Repository

