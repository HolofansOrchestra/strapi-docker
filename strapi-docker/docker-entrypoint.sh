#!/bin/sh
set -ea

if [ ! -f "package.json" ]; then
    DOCKER=true strapi new . \
        --no-run \
        --dbclient=${DB_CLIENT:-mysql} \
        --dbhost=$DB_HOST \
        --dbport=$DB_PORT \
        --dbname=$DB_NAME \
        --dbusername=$DB_USER \
        --dbpassword=$DB_PASSWORD \
        $EXTRA_ARGS
fi

if [ ! -d "node_modules" ]; then
    yarn install --prod
fi

exec strapi start
