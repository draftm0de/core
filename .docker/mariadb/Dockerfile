FROM mariadb:11.1.3

# Set timezone
ARG TIME_ZONE
ENV TZ=${TIME_ZONE}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
