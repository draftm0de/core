# ----------------------------------------------------------------
# ARGS
#   WORKING_DIR (default: /var/www/app)
#   CONNECTOR (default: port)
# ----------------------------------------------------------------
FROM php:8.2-fpm-alpine

# Define build arguments and default values
ARG WORKING_DIR=${WORKING_DIR:-/var/www/app}
WORKDIR ${WORKING_DIR}

ARG WORKING_DIR=${WORKING_DIR:-/var/www/app}
ARG CONNECTOR=${CONNECTOR:-port}
ENV DOCKER_ETC_PATH=${CONNECTOR:-/usr/local/etc}
ENV DOCKER_BIN_PATH=/.usr/local/bin

# --- provide custom docker-entrypoint ---
COPY $DOCKER_BIN_PATH/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
# --- provide custom healthcheck ---
COPY $DOCKER_BIN_PATH/docker-healthcheck.sh /usr/local/bin/docker-healthcheck

# Install build dependencies and PHP extensions
RUN apk update \
 && docker-php-ext-install pdo pdo_mysql \
# --- provide custom docker-entrypoint ---
 && chmod +x /usr/local/bin/docker-entrypoint \
# --- provide custom healthcheck ---
 && chmod +x /usr/local/bin/docker-healthcheck

# Set the working directory
WORKDIR ${WORKING_DIR}

ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]