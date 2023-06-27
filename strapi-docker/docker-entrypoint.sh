#!/bin/sh
set -eu

if [ ! -f "/srv/app/package.json" ]; then
    mkdir /strapi_tmp
    cd /strapi_tmp
    yarn create strapi-app . --no-run \
        --dbclient=mysql \
        --dbhost=$DATABASE_HOST \
        --dbport=$DATABASE_PORT \
        --dbname=$DATABASE_NAME \
        --dbusername=$DATABASE_USERNAME \
        --dbpassword=$DATABASE_PASSWORD
    yarn install --prod
    yarn add mysql2
    mv -n /strapi_tmp/* /srv/app
    rm -r /strapi_tmp
fi

cd /srv/app

eval $CUSTOM_COMMAND

yarn build

mkdir -p public/uploads

if [ $NODE_ENV = "develop" ]; then
    exec yarn strapi develop
else
    exec yarn strapi start
fi