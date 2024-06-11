FROM php:8.2-fpm-alpine

ARG WORK_DIR
ARG TIME_ZONE
ENV TZ=${TIME_ZONE}
ARG WWW_LISTEN=9000
ENV WWW_LISTEN=${WWW_LISTEN}

ARG WWW_USER=www-data
ENV WWW_USER=${WWW_USER}
ARG WWW_GROUP=www-data
ENV WWW_GROUP=${WWW_GROUP}
ARG WWW_PM=dynamic
ENV WWW_PM=${WWW_PM}
ARG WWW_PM_MAX_CHILDREN=5
ENV WWW_PM_MAX_CHILDREN=${WWW_PM_MAX_CHILDREN}
ARG WWW_PM_START_SERVERS=2
ENV WWW_PM_START_SERVERS=${WWW_PM_START_SERVERS}
ARG WWW_PM_MIN_SPARE_SERVERS=1
ENV WWW_PM_MIN_SPARE_SERVERS=${WWW_PM_MIN_SPARE_SERVERS}
ARG WWW_PM_MAX_SPARE_SERVERS=3
ENV WWW_PM_MAX_SPARE_SERVERS=${WWW_PM_MAX_SPARE_SERVERS}

# internal folders
ENV DOCKER_BIN_PATH=/usr/local/bin
ENV PHP_FPM_PATH=/usr/local/etc/php-fpm.d
ENV PHP_CONF_PATH=/usr/local/etc/php/conf.d

ENV APK_ADD_NO_CACHE \
# optional: like bash more than sh
    bash \
# optional: i like nano more than vim
    nano \
# required to set timezone
    tzdata

# --- provide custom healthcheck ---
COPY $DOCKER_BIN_PATH/docker-healthcheck.sh /usr/local/bin/docker-healthcheck
# --- default configurations for php-fpm.d and conf.d
COPY $PHP_FPM_PATH $PHP_FPM_PATH
COPY $PHP_CONF_PATH $PHP_CONF_PATH

RUN apk add --update --no-cache ${APK_ADD_NO_CACHE} \
 && apk upgrade --available \
# --- remove default php-fpm.d/conf --- \
 && rm -f $PHP_FPM_PATH/zz-docker.conf \
 && rm -f $PHP_FPM_PATH/www.conf.default \
 && rm -f $PHP_FPM_PATH/www.conf \
# --- add date.timezone to php conf ---
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 # --- make custom scripts executable ---
 && chmod +x /usr/local/bin/docker-healthcheck

WORKDIR $WORK_DIR

ENV APP_ENV=prod

CMD ["php-fpm"]
