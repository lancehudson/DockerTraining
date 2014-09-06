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

# Build AptCacher Image
docker build -t apt-cacher-ng AptCacher

# Install Apt-Cacher-ng - 172.17.42.1:3142
echo 'Acquire::http::Proxy "http://172.17.42.1:3142";' >> /etc/apt/apt.conf.d/01proxy
docker run -d -p 3142:3142 --name apt-cacher-ng-run apt-cacher-ng

# Update base
apt-get upgrade

# Pull down submodules
git submodule init

# Build NPM Lazy Image
docker build -t npm-lazy NPMLazy

# Install NPM Lazy
docker run -d -p 8080:8080 --name npm-lazy-run npm-lazy

# Build Gitlab
docker build -t gitlab Gitlab

# Install Gitlab
docker run -d --name gitlab-run -p 10022:22 -p 10080:80 -e 'GITLAB_PORT=10080' -e 'GITLAB_SSH_PORT=10022' gitlab

# Clone required github repositories

# Build Registry
docker build -t registry Registry

# Install Registry
docker run -d -p 5000:5000 --name registry-run registry

# Build Example Images
docker build -t helloworld HelloWorld

# Push all Images

