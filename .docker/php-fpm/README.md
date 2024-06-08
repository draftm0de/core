# PHP-FPM

### run via port

### run via socket

### Healthcheck
using /usr/local/bin/docker-healthcheck.sh as already implemented
#### run php-fpm via a port
--connect={PORT}<br><br>
example via docker-compose
```
    healthcheck:
      test: ["CMD", "docker-healthcheck", "-connect=9000"]
      interval: 10s
      timeout: 3s
      retries: 3
      start_period: 30s
```
#### run php-pgm via a socket
--connect={SOCKET_FILE}<br><br>
example via docker-compose
```
    healthcheck:
      test: ["CMD", "docker-healthcheck", "-connect=/var/run/php/php-fpm.sock"]
      interval: 10s
      timeout: 3s
      retries: 3
      start_period: 30s
```
