FROM node:16-slim as node

RUN mkdir -p /srv/app && chown 1000:1000 -R /srv/app

WORKDIR /srv/app

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh && ln -s /usr/local/bin/docker-entrypoint.sh

RUN yarn create strapi-app . --no-run --quickstart \
	&& yarn install --prod \
	&& yarn add mysql2 \
	&& yarn build

ENTRYPOINT ["docker-entrypoint.sh"]