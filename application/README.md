# Enjoy out of the box solutions

## examples

Each folder (based on his name) provide an out of the box running example.

- (30.06.2024) caddy-port-php-fpm
- (30.06.2024) caddy-socket-php-fpm
- (30.06.2024) nginx-port-php-fpm
- (30.06.2024) nginx-socket-php-fpm
- (01.07.2024) caddy-socket-php-fpm-mariadb

next
- caddy-socket-php-fpm-vue
- caddy-socket-api-platform-vue

#### caddy-port-php-fpm
#### caddy-socket-php-fpm
#### nginx-port-php-fpm
#### nginx-socket-php-fpm
#### caddy-socket-php-fpm-mariadb

## .base (base images)

Each service has to have (build) his own images.<br/>

On top, you need some BASE images. The base images will prepare you an image with

- all required application plugins (e.g. composer)
- all required operating system plugins (e.g. tzdata)

**_The base image does not include any content_**

Our base images are:

- [php-fpm/README.md](../.docker/php-fpm/README.md)
- [caddy/README.md](../.docker/caddy/README.md)
- [nginx/README.md](../.docker/nginx/README.md)
- [mariadb/README.md](../.docker/mariadb/README.md)

## application images

Inside each folder (/port, /socket) you will find

- docker-compose.yml(s)
- webserver
  - source
    - e.g. index.html
  - .deploy 
- php
  - source
    - e.g. index.php

Your application images has to be based on previously built "base" images.<br/>

The responsibility of an application image is
- combine functional images (base images) with content/source

_Nothing more and nothing less_<br/><br/>

_Notice_<br/>
In these examples (and it will be the same in the others) the docker-compose.yml will look a little bit confusing releated to build-arguments and environment arguments.

We use them to explicitly visualize which type of action (build, up, ...) has to have which arguments. No matter where they come from (e.g. .env). It´s about transparency.

The docker-compose.yml (production level) does not have to have any environment arguments because they are set in the Dockerfile and build process. 
But we abuse them because they are relevant for any "overload" e.g. docker-compose.override.yml.<br/><br/>
It might sound a little bit inconsistent, but we want to centralize (single point of truth) the build- and environment arguments.  
