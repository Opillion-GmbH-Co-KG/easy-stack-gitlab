ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO_NAME=opillion
FROM ${DOCKER_REPO_NAME}/gitlab:${BASE_IMAGE_TAG}

ADD .docker/prod/gitlab/script /script
RUN chmod -R 755 /script

