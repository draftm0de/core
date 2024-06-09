# PHP-FPM
our current base-images uses ``php:8.2-fpm-alpine``
## Set up (Dockerfile)
customized PHP (ini) files are created prefixed with ``zz.{what.ever}.ini``<br>
It´s because we want our customizations being included at the end to overwrite previous ones.
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
```
# --- add www.list to php conf (static) ---
RUN printf '[www]\nlisten=9000' > /usr/local/etc/php/conf.d/zz.www.listen.ini
```
```
# --- add www.list to php conf (dynamic) ---
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
