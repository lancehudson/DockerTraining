#! /bin/sh

# Install OpenSSH, curl and git
apt-get update
apt-get install openssh-server git

# Install Docker
curl -sSL https://get.docker.io/ubuntu/ | sh
adduser user docker

# Build Docker Images
docker build -t apt-cacher-ng AptCacher
docker build -t npm-lazy NPMLazy


# Install Apt-Cacher-ng

# Install NPM Lazy

# Install Gitlab

# Install Docker-Repository

