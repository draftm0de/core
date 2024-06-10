FROM php:8.2-fpm-alpine

ARG WORK_DIR
ARG TIME_ZONE
ARG WWW_LISTEN=9000
ARG WWW_LISTEN_OWNER=0
ARG WWW_LISTEN_GROUP=0

ENV TZ=${TIME_ZONE}
ENV APP_ENV=prod
ENV DOCKER_BIN_PATH=/usr/local/bin
ENV PHP_FPM_PATH=/usr/local/etc/php-fpm.d

ENV APK_ADD_NO_CACHE \
# optional: like bash more than sh
    bash \
# optional: i like nano more than vim
    nano \
# required to set timezone
    tzdata

# --- provide custom healthcheck ---
COPY $DOCKER_BIN_PATH/docker-healthcheck.sh /usr/local/bin/docker-healthcheck
# --- provide custom healthcheck ---
COPY $DOCKER_BIN_PATH/create-socket-user.sh /usr/local/bin/create-socket-user
# --- default configurations for
# - zz.global.conf
# - zz.www.conf
# - zz.www.pm.conf
COPY $PHP_FPM_PATH $PHP_FPM_PATH

RUN apk add --update --no-cache ${APK_ADD_NO_CACHE} \
 && apk upgrade --available \
# --- remove default php-fpm.d/conf --- \
 && rm -f $PHP_FPM_PATH/zz-docker.conf \
 && rm -f $PHP_FPM_PATH/www.conf.default \
 && rm -f $PHP_FPM_PATH/www.conf \
# --- add date.timezone to php conf ---
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 && printf '[Date]\ndate.timezone="%s"\n' $TZ > /usr/local/etc/php/conf.d/zz.date.ini \
# --- set www.listen ---
 && sed -i 's/{WWW_LISTEN}/'${WWW_LISTEN}'/' /usr/local/etc/php-fpm.d/zz.www.conf \
 # --- make custom scripts executable ---
 && chmod +x /usr/local/bin/docker-healthcheck \
 && chmod +x /usr/local/bin/create-socket-user

# --- run: create-socket-user ---
# RUN /usr/local/bin/create-socket-user

WORKDIR $WORK_DIR

CMD ["php-fpm"]
