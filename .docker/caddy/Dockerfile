ARG IMAGE_TAG
# ----------------------------------------------------------------------------
# production-stage
# ----------------------------------------------------------------------------
FROM caddy:${IMAGE_TAG} as prod

ENV APK_ADD \
    nss-tools \
    nano

RUN apk add --update --no-cache ${APK_ADD} \
    && apk upgrade --available

COPY etc/caddy/* etc/caddy/*

# ----------------------------------------------------------------------------
# local-stage
# ----------------------------------------------------------------------------
FROM prod as local

COPY etc/caddy.local/* etc/caddy/*