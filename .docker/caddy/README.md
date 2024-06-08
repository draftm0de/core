# caddy webserver
official page: https://caddyserver.com/
## Set up
### Timezone
#### Dockerfile: static
```
ENV TZ=Europe/Vienna
```
#### Dockerfile: dynamic (as a build argument --build-arg="TZ=Europe/Vienna")
```
ARG TZ
ENV TZ=${TZ}
```
#### docker-compose.yml
Set argument TZ (e.g. Europe/Vienna)
```
services:
  webserver:
    environment:
      TZ: ${TZ}
```
