ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO_NAME=opillion
FROM ${DOCKER_REPO_NAME}/gitlab:${BASE_IMAGE_TAG}

ADD .docker/dev/gitlab/script /script
RUN /bin/busybox chmod -R 755 /script


