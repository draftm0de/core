FROM caddy

ARG TIME_ZONE
ENV TZ=${TIME_ZONE}

ENV APK_ADD \
    tzdata \
    nss-tools \
    curl

RUN apk add --update --no-cache ${APK_ADD}