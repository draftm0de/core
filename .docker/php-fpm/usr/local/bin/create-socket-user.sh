#!/bin/sh

split_and_assign() {
    local field=$1
    local input=$2
    if echo "$input" | grep -q ':'; then
        # Split by colon
        USER_NAME=$(echo $input | cut -d ':' -f 1)
        USER_ID=$(echo $input | cut -d ':' -f 2)
    else
        # Handle missing colon
        echo "<E> argument $1 has to contain (:), given '$input'." >&2
        exit 1
    fi
}

if [ "$WWW_LISTEN_GROUP" != "0" ] && [ "$WWW_LISTEN_OWNER" != "0" ]; then
    # Split and assign values for WWW_LISTEN_GROUP
    split_and_assign "WWW_LISTEN_GROUP" $WWW_LISTEN_GROUP
    GROUP_NAME=$USER_NAME
    GROUP_ID=$USER_ID
    # Split and assign values for WWW_LISTEN_OWNER
    split_and_assign "WWW_LISTEN_OWNER" $WWW_LISTEN_OWNER
    USER_NAME=$USER_NAME
    USER_ID=$USER_ID
    # create group and user
    echo "[$0] added group $GROUP_NAME (#$GROUP_ID)" >&2
    addgroup -g $GROUP_ID -S $GROUP_NAME
    echo "[$0] added user $USER_NAME (#$USER_ID) and join to group $GROUP_NAME" >&2
    adduser -u $USER_ID -S -D -G $GROUP_NAME $USER_NAME
    #
    # sed -i 's/listen.owner = www-data/'listen.owner = ${USER_NAME}'/' /usr/local/etc/php-fpm.d/zz.www.conf
    # sed -i 's/listen.group = www-data/'listen.group = ${GROUP_NAME}'/' /usr/local/etc/php-fpm.d/zz.www.conf
fi
exit 0