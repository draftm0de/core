# Enjoy out of the box solutions

## examples

Each folder (based on his name) provide an out of the box running example.

- caddy-port-php-fpm
- caddy-socket-php-fpm
- nginx-port-php-fpm
- nginx-socket-php-fpm

(next)
- caddy-port-php-fpm-mysql
- nginx-port-php-fpm-mysql

#### caddy-port-php-fpm
#### caddy-socket-php-fpm
#### nginx-port-php-fpm
#### nginx-socket-php-fpm

## .base (base images)

Your application has to have his own images within a
- build
- production
- local/dev

stages

But on top you need some BASE images. The base images will prepare you an image with

- all required application plugins (e.g. composer)
- all required operating system plugins (e.g. tzdata)

**_The base image does not include any content_**

This repository share the same Dockerfiles for multiple examples. Therefore, this repository refers via .env refer to them.

- [php-fpm/README.md](../../../.docker/php-fpm/README.md)
- [caddy/README.md](../../../.docker/caddy/README.md)
- [nginx/README.md](../../../.docker/nginx/README.md)

## application images

Inside each folder (/port, /socket) you will find

- docker-compose.yml(s)
- a folder php
- a folder webserver

Your application images has to be based on the previously built "base" images.<br/>

The responsibility of an application image is
- combine functional images (base images) with content/source

_Nothing more and nothing less_<br/><br/>

_Notice_<br/>
In this example (and it will be the same in the others) the docker-compose.yml will look a little bit confusing releated to build-arguments and environment arguments.

We use them to explicitly visualize which type of action (build, up, ...) has to have which arguments. No matter where they come from (e.g. .env). It´s about transparency.

The docker-compose.yml (production level) does not have to have any environment arguments because they are set in the Dockerfile and build process. 
But we abuse them because they are relevant for any "overload" e.g. docker-compose.override.yml.<br/><br/>
It might sound a little bit inconsistent, but we want to centralize (single point of truth) the build- and environment arguments.  

