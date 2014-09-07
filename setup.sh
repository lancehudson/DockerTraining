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
apt-get dist-upgrade -y

# Pull down submodules
git submodule update --init

# Build NPM Lazy Image
docker build -t npm-lazy NPMLazy

# Install NPM Lazy
docker run -d -p 8080:8080 --name npm-lazy-run npm-lazy

# Build Gitlab
docker build -t gitlab Gitlab

# Install Gitlab
docker run -d --name gitlab-run -p 10022:22 -p 10080:80 -e 'GITLAB_PORT=10080' -e 'GITLAB_SSH_PORT=10022' gitlab

# Clone required github repositories
## Update Gitlab password
### Get Gitlab Token
export GITLAB_TOKEN=$(expr "$(curl --silent -X POST -H "Accept:application/json" -H "Cache-Control:no-cache" http://192.168.5.118:10080/api/v3/session?login=root\&password=5iveL\!fe)" : '.*"private_token":"\([^"]*\)"')
### Change Password
curl -X PUT -H "Accept:application/json" -H "PRIVATE-TOKEN:$GITLAB_TOKEN" -H "Content-Type:application/json" -H "Cache-Control:no-cache" -d '{"password": "dockertraining"}' http://192.168.5.118:10080/api/v3/users/1
## Create LanceHudson group
curl -X POST -H "Accept:application/json" -H "PRIVATE-TOKEN:$GITLAB_TOKEN" -H "Content-Type:application/json" -H "Cache-Control:no-cache" -d '{"name":"LanceHudson","path":"lancehudson"}' http://192.168.5.118:10080/api/v3/groups
## Add root to LanceHudson group
curl -X POST -H "Accept:application/json" -H "PRIVATE-TOKEN:$GITLAB_TOKEN" -H "Content-Type:application/json" -H "Cache-Control:no-cache" -d '{"user_id":1,"access_level":"50"}' http://192.168.5.118:10080/api/v3/groups/2/members
## Create Projects
curl -X POST -H "Accept:application/json" -H "PRIVATE-TOKEN:$GITLAB_TOKEN" -H "Content-Type:application/json" -H "Cache-Control:no-cache" -d '{"name":"HelloWorld","namespace_id":2,"public":true, "description":""A simple hello world node application for playing with docker", import_url": "https://github.com/lancehudson/HelloWorld.git"}' http://192.168.5.118:10080/api/v3/projects
curl -X POST -H "Accept:application/json" -H "PRIVATE-TOKEN:$GITLAB_TOKEN" -H "Content-Type:application/json" -H "Cache-Control:no-cache" -d '{"name":"DockerTraining","namespace_id":2,"public":true, "description":"Docker Training for Fossetcon 2014 Orlando, FL", "import_url": "https://github.com/lancehudson/DockerTraining.git"}' http://192.168.5.118:10080/api/v3/projects

# Build Registry
#docker build -t registry Registry

# Install Registry
docker run -d -p 5000:5000 --name registry-run registry

# Build System Proxy
docker build -t proxy Proxy

# Install Proxy
docker run -d -p 443:443 -p 80:80 --link gitlab-run:gitlab --link registry-run:registry --name proxy-run proxy

# Build Captive DNS
docker build -t dns Dns

# Install Captive DNS
docker run -d -p 53:9999/udp --name dns-run dns

# Build Example Images
docker build -t helloworld HelloWorld

# Push all Images

# Sandbox Container's DNS
echo "DOCKER_OPTS=\"--dns 127.0.0.1\"" >> /etc/default/docker
service docker restart
sleep 5

# Start containers
docker start dns-run
docker start npm-lazy-run
docker start registry-run
docker start gitlab-run
docker start apt-cacher-ng-run
docker start proxy-run