ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO_NAME=opillion
FROM ${DOCKER_REPO_NAME}/gitlab:${BASE_IMAGE_TAG}

RUN apk add --no-cache qemu-user-static

ADD .docker/dev/gitlab/script /script



