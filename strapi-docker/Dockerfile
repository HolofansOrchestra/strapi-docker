FROM node:16-slim as node

RUN mkdir /srv/app && chown 1000:1000 -R /srv/app

COPY docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]