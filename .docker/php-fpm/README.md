# PHP-FPM
our current base-images uses ``php:8.2-fpm-alpine``
## Build Arguments
- WORK_DIR _**(required)**_
- TIME_ZONE _**(required)**_
- WWW_LISTEN _(default: 9000)_
- WWW_USER _(default: www-data)_
- WWW_GROUP _(default: www-data)_
- WWW_PM _(default: dynamic)_
- WWW_PM_MAX_CHILDREN _(default: 5)_
- WWW_PM_START_SERVERS _(default: 2)_
- WWW_PM_MIN_SPARE_SERVERS _(default: 1)_
- WWW_PM_MAX_SPARE_SERVERS _(default: 3)_
## Set up (Dockerfile)
Customized PHP (ini/conf) files are created prefixed with ``zz.{what.ever}.{ini/conf}``<br>
Prefixed with {zz.} because we want our customizations being included at the end to overwrite previous ones.
### Timezone
```
# add tzadata
RUN apk add --update --no-cache tzdata \

# --- set timezone for container ---
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
```
### php-fpm listen
In default the used image (php:8.2-fpm-alpine) expose port 9000.<br>
That means your ``docker compose ps`` will always show you 9000/tcp.
```
NAME                IMAGE             COMMAND                  SERVICE     CREATED         STATUS         PORTS
caddy-php-1         caddy-php         "docker-php-entrypoi…"   php         3 seconds ago   Up 3 seconds   9000/tcp
```
**but**<br/>
only the [www] listen = {} directive is on what PHP-FPM is listening
- there is no need to set up any EXPOSE directive in your docker-compose.yml
- there is no need to set up any EXPOSE directive in your Dockerfile
- there is no need to set up any PORT directive in your docker-compose.yml
#### php-fpm listen on a port
Just set WWW_LISTEN to e.g. 9090, that´s it.<br/>
You just have to be sure, that your webserver (e.g. caddy) and the php container share the same volume.<br/>
```
services:
  webserver:
    volumes:
      - sock:/socket

  php:
    volumes:
      - sock:/socket

volumes:
  sock:
```
The php-fpm directive for listen will look like
```
[www]
listen=/socket/web.fpm
listen.mode = 0666
```
#### php-fpm listen on a socket
Just set WWW_LISTEN to e.g. (sock/docker.socket), that´s it
## Healthcheck
using */usr/local/bin/docker-healthcheck.sh* as already implemented
### php-fpm listen on a port
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
### php-fgm listen on a socket
--connect={SOCKET_FILE}<br><br>
example via docker-compose
```
    healthcheck:
      test: ["CMD", "docker-healthcheck", "-connect=unix:/socket/web.fpm"]
      interval: 10s
      timeout: 3s
      retries: 3
      start_period: 30s
```
