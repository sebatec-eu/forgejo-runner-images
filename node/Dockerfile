FROM docker.io/library/node:lts-trixie
ENV DEBIAN_FRONTEND=noninteractive

ARG IMAGE_REVISION
LABEL org.opencontainers.image.revision=$IMAGE_REVISION
LABEL org.opencontainers.image.url=https://forge.sebatec.eu/actions/runner-images
LABEL org.opencontainers.image.source=https://github.com/sebatec-eu/forgejo-runner-images

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "bash" ]
