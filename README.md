# core
This repository tries to provide solutions for a couple of different issues related to
- docker
- docker-compose
- php
- nginx
- caddy
- openresty
- reverse proxy

## domains
we are using for caddy (self certificate supported)
- [https://www.dev.demo.io](https://www.dev.demo.io)
- [https://api.dev.demo.io](https://api.dev.demo.io)

and for nginx (no self certificate support)
- [http://www.dev.demo.io](http://www.dev.demo.io)
- [http://api.dev.demo.io](http://api.dev.demo.io)

### windows hosts
```
127.0.0.1 www.dev.demo.io
127.0.0.1 api.dev.demo.io
```

## base images
### webserver
- [Caddy](./.docker/caddy/README.md)
- [Nginx](./.docker/nginx/README.md)
- [Openresty](./.docker/openresty/README.md)
### php
- [PHP-FPM](./.docker/php-fpm/README.md)
## Solutions
### PHP + Caddy
- proxy to php by port
- proxy to php by socket
### PHP + Nginx
- proxy to php by port
- proxy to php by socket
