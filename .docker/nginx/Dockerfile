FROM nginx:alpine3.19

ARG TIME_ZONE
ENV TZ=${TIME_ZONE}

ENV APK_ADD_NO_CACHE \
# optional: like bash more than sh
    bash \
# optional: i like nano more than vim
    nano \
# required to set timezone
    tzdata

RUN apk add --update --no-cache ${APK_ADD_NO_CACHE} \
 && apk upgrade --available \
 && mkdir /etc/nginx/custom

COPY /etc/nginx/custom /etc/nginx/custom
# .docker/nginx/Dockerfile
# .docker/nginx/etc