#!/bin/bash
docker rmi $(docker images | grep "app-php-caddy-socket" | awk '{print $3}')