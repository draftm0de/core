# ---------------------------------------------------------------
# build stage
# ---------------------------------------------------------------
ARG IMAGE_NAME
ARG IMAGE_TAG
FROM ${IMAGE_NAME}:${IMAGE_TAG} as build

ARG CONTENT_SOURCE_PATH
ARG CONTENT_TARGET_PATH
WORKDIR ${CONTENT_TARGET_PATH}

COPY ${CONTENT_SOURCE_PATH} ${CONTENT_TARGET_PATH}

# composer directive
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN if [[ -f composer.json ]]; then \
       echo "[I] run composer install"; \
       composer install \
        --no-interaction \
        --no-plugins \
        --no-scripts \
        --no-dev \
        --prefer-dist; \
        composer dump-autoload; \
    else; \
       echo "[I] no composer.json given, no composer install"; \
    fi

# ---------------------------------------------------------------
# production stage
# ---------------------------------------------------------------
ARG IMAGE_NAME
ARG IMAGE_TAG
FROM ${IMAGE_NAME}:${IMAGE_TAG} as production

ARG IMAGE_TAG
ARG IMAGE_NAME
ARG CONTENT_SOURCE_PATH
ARG CONTENT_TARGET_PATH
ARG WWW_LISTEN

ENV BASE_IMAGE=${IMAGE_NAME}:${IMAGE_TAG}
ENV WWW_LISTEN=${WWW_LISTEN}

WORKDIR ${CONTENT_TARGET_PATH}

COPY --from=build ${CONTENT_TARGET_PATH} ${CONTENT_TARGET_PATH}

# ---------------------------------------------------------------
# dev/local stage
# ---------------------------------------------------------------
ARG IMAGE_NAME
ARG IMAGE_TAG
FROM ${IMAGE_NAME}-dev:${IMAGE_TAG} as dev

ARG IMAGE_TAG
ARG IMAGE_NAME
ARG CONTENT_TARGET_PATH
ARG WWW_LISTEN

ENV WWW_LISTEN=${WWW_LISTEN}
ENV BASE_IMAGE=${IMAGE_NAME}-dev:${IMAGE_TAG}

WORKDIR ${CONTENT_TARGET_PATH}
