Fossetcon 2014 Docker Training (1.5 hours)
==========================================

Included in an OVA with all of the class materials and guide.

Import the OVA then open a browser to the OVA's ip address.

There are four examples included:

* Hello World
* PHP ?????
* Complex Example
* BONUS: Highly Avaliable Complex Example

# Examples
## Hello World

This is a simple NodeJS application. The command to run it is

	docker run -d -p 1337:8080 github.com/lancehudson/HelloWorld
## PHP

## Complex Example

## BONUS: Highly Avaliable Complex Exmaple

# OVA Information

In order to support offline use I have installed several docker images that run automatically inside the VM to support running the examples and building the examples.

I started with Ubuntu and installed the minimum of packages.

It is setup with a username of user and a password of docker.

Then I added:

* OpenSSH Server
* Git
* Docker

Then I loaded the supporting docker containers and setup the needed settings to use them.

see setup.sh

## Apt-Cacher-ng

This container acts as a cache and proxy for Ubuntu's apt-get.

## NPM Lazy

This container acts as a cache and proxy for NPM.

## Gitlab

This is a git server that I have setup to pretend to be github so that docker builds from github would work.

The admin user is root and the password is dockertraining

## Docker Registry

This is a private docker registry that contains an image of each of the examples and the supporting containers. I configured it to pretend to be the public docker registry hub.docker.io.