# PHP-FPM
our current base-images uses ``php:8.2-fpm-alpine``
## Set up (Dockerfile)
Customized PHP (ini/conf) files are created prefixed with ``zz.{what.ever}.{ini/conf}``<br>
Prefixed with {zz.} because we want our customizations being included at the end to overwrite previous ones.
#### Timezone
```
# add tzadata
RUN apk add --update --no-cache tzdata \

# --- set timezone for container ---
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \

# --- set timezone for php --- 
 && printf '[Date]\ndate.timezone="%s"\n' $TZ > /usr/local/etc/php/conf.d/zz.date.timezone.ini \
```
#### php-fpm listen on a port
In default the used image (php:8.2-fpm-alpine) expose port 9000. That means your ``docker compose ps`` will always show you 9000/tcp.
```
NAME                IMAGE             COMMAND                  SERVICE     CREATED         STATUS         PORTS
caddy-php-1         caddy-php         "docker-php-entrypoi…"   php         3 seconds ago   Up 3 seconds   9000/tcp
```
- our used php-base-image (.docker/php-fpm/Dockerfile) handle the build argument WWW_LISTEN to set the [www] listen = {WWW_LISTEN}. 
- to proxy (e.g. with caddy directive php_fastcgi) you need to proxy to {container_name}:{port}
- It´s about how you configure PHP-FPM to listen for<br/>
_default php:8.2-fpm-alpine expose 9000 and set the [www] listen = 9000_
- There is no need to set up any EXPOSE directive in your docker-compose.yml
- There is no need to set up any PORT directive in your docker-compose.yml
```
# --- add www.list to php conf (static) ---
RUN printf '[www]\nlisten=9000' > /usr/local/etc/php/conf.d/zz.www.listen.ini
```
```
# --- add www.list to php conf (dynamic (.docker/php-fpm/Dockerfile)) ---
RUN printf '[www]\nlisten=%s\n' $PORT > /usr/local/etc/php/conf.d/zz.www.listen.ini \
```
#### php-fpm listen on a socket
```
...tbd
```
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
      test: ["CMD", "docker-healthcheck", "-connect=/var/run/php/php-fpm.sock"]
      interval: 10s
      timeout: 3s
      retries: 3
      start_period: 30s
```
