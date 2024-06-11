# webserver + nginx
## .env
### proxy to php via port
```
# global
TIME_ZONE=Europe/Vienna
# html
HTML_CONTENT_FOLDER=/var/www/html
# php
PHP_CONTAINER_NAME=php
PHP_WWW_LISTEN=9000
PHP_WORK_DIR=/var/www/app
```
#### build arguments (php)
- TIME_ZONE
- PHP_WORK_DIR
- PHP_WWW_LISTEN
#### build arguments (webserver)
- TIME_ZONE

### proxy to php via socket
```
# global
TIME_ZONE=Europe/Vienna
# html
HTML_CONTENT_FOLDER=/var/www/html
# php
PHP_CONTAINER_NAME=php
PHP_WWW_LISTEN_PATH=/sock
PHP_WWW_LISTEN=$PHP_WWW_LISTEN_PATH/docker.sock
PHP_WORK_DIR=/var/www/app
```
#### build arguments (php)
- TIME_ZONE
- PHP_WORK_DIR
- PHP_WWW_LISTEN
#### build arguments (webserver)
- TIME_ZONE
