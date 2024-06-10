# nginx webserver
official page: https://nginx.org/en/docs/
## Set up
### using environment variables (nginx templates)
Using the default nginx (alpine), as we do, the nginx.conf includes /etc/nginx/conf.d/*.conf<br/>

Files located in /etc/nginx/templates are automatically converted with environment arguments and stored into /etc/nginx/conf.d/* when starting nginx.<br/>
#### example
```
docker-compose.yml
services:
  webserver:
    environment:
      ROOT_FOLDER: my/root/folder

/etc/nginx/templates/my.conf.template
server {
  root ${ROOT_FOLDER};
}

=> /etc/nginx/conf.d/my.conf
server {
  root my/root/folder;
}
```
#### changing the template
Changing the template files requires a new docker-compose up, cause the magic happens via docker-entrypoint(s).

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
