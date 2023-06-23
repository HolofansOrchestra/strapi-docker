#!/bin/sh
set -eu

cd /srv/app

if [ ! -f "package.json" ]; then
    yarn create strapi-app . --no-run --quickstart
fi

if [ ! -d "node_modules" ]; then
    yarn install --prod
fi

if [ ! -d "node_modules/mysql2" ]; then
    yarn add mysql2
fi

exec yarn build

if [ $NODE_ENV = "develop" ]; then
    exec yarn strapi develop
else
    exec yarn strapi start
fi