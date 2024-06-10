# caddy webserver
official page: https://caddyserver.com/
## Set up
### using environment variables
caddy, out of the box, supports envsource.
#### example
```
docker-compose.yml
services:
  webserver:
    environment:
      ROOT_FOLDER: my/root/folder

/etc/caddy/Caddyfile
www.dev.demo.io {
	tls internal
    root * {$ROOT_FOLDER}
    file_server
}
```
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
