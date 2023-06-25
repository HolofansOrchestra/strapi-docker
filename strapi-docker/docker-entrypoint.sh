#!/bin/sh
set -eu

cd /srv/app

eval $CUSTOM_COMMAND

mkdir -p public/uploads

if [ $NODE_ENV = "develop" ]; then
    exec yarn strapi develop
else
    exec yarn strapi start
fi