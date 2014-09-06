#! /bin/sh

# Install OpenSSH, curl and git
apt-get update
apt-get install openssh-server git

# Install Docker
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# Then import the repository key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Install Docker
apt-get update
apt-get install -y lxc-docker
adduser user docker

# Setup login Script
cp Files/get-ip-address /usr/local/bin/get-ip-address
chmod +x /usr/local/bin/get-ip-address
cp Files/show-ip-address /etc/network/if-up.d/show-ip-address
chmod +x /etc/network/if-up.d/show-ip-address
cp Files/issue-standard /etc/issue-standard

# Setup Init Script
cp Files/rc.local /etc/rc.local
chmod +x /etc/rc.local

# Build AptCacher Images
docker build -t apt-cacher-ng AptCacher

# Install Apt-Cacher-ng - 172.17.42.1:3142
echo 'Acquire::http::Proxy "http://172.17.42.1:3142";' >> /etc/apt/apt.conf.d/01proxy
docker run -d -p 3142:3142 --name apt-cacher-ng-run apt-cacher-ng

# Build Docker Images
docker build -t npm-lazy NPMLazy

# Install NPM Lazy

# Install Gitlab

# Install Docker-Repository

