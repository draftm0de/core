# ---------------------------------------------------------------
# build stage
# ---------------------------------------------------------------
ARG IMAGE_NAME
ARG IMAGE_TAG
FROM ${IMAGE_NAME}:${IMAGE_TAG} AS build

ARG SOURCE_PATH
ARG TARGET_PATH
WORKDIR ${TARGET_PATH}

COPY ${SOURCE_PATH} ${TARGET_PATH}

# composer directive
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN if [ -f composer.json ]; then \
       echo "[I] run composer install"; \
       composer install \
        --no-interaction \
        --no-plugins \
        --no-scripts \
        --no-dev \
        --prefer-dist; \
       composer dump-autoload; \
    else \
       echo "[I] no composer.json given, no composer install"; \
    fi

# ---------------------------------------------------------------
# production stage
# ---------------------------------------------------------------
ARG IMAGE_NAME
ARG IMAGE_TAG
FROM ${IMAGE_NAME}:${IMAGE_TAG}

ARG IMAGE_TAG
ARG IMAGE_NAME
ARG TARGET_PATH
ARG WWW_LISTEN

ENV BASE_IMAGE=${IMAGE_NAME}:${IMAGE_TAG}
ENV WWW_LISTEN=${WWW_LISTEN}

WORKDIR ${CONTENT_TARGET_PATH}

COPY --from=build ${TARGET_PATH} ${TARGET_PATH}
