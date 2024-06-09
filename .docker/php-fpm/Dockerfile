FROM php:8.2-fpm-alpine

ARG WORK_DIR
ARG TZ
ARG PORT=9000

ENV TZ=${TZ}
ENV APP_ENV=prod
ENV DOCKER_BIN_PATH=/usr/local/bin

ENV APK_ADD_NO_CACHE \
# optional: like bash more than sh
    bash \
# optional: i like nano more than vim
    nano \
# required to set timezone
    tzdata

# --- provide custom healthcheck ---
COPY $DOCKER_BIN_PATH/docker-healthcheck.sh /usr/local/bin/docker-healthcheck

RUN apk add --update --no-cache ${APK_ADD_NO_CACHE} \
 && apk upgrade --available \
# --- add date.timezone to php conf ---
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 && printf '[Date]\ndate.timezone="%s"\n', $TZ > /usr/local/etc/php/conf.d/zz.date.timezone.ini \
# --- add www.list to php conf ---
 && printf '[www]\nlisten=%s\n' $PORT > /usr/local/etc/php/conf.d/zz.www.listen.ini \
# --- provide custom healthcheck ---
 && chmod +x /usr/local/bin/docker-healthcheck

WORKDIR $WORK_DIR

EXPOSE $PORT

CMD ["php-fpm"]
