# EASY STACK GITLAB

## GitLab latest (v17.5.1) - [Official Website](https://about.gitlab.com)  & [Gitlab Docker Images](https://hub.docker.com/u/gitlab)
![Alt text](.makefile/assets/gitlab-logo-100.jpg?raw=true "GitLab Logo")

## Introduction
This application is a versatile and comprehensive solution that provides a framework for various Docker containers. It can include different types of services, such as backends in Java or PHP, any kind of frontend, or even a complete Docker stack. Modify it to suit your needs. Check out our upcoming Easy-Stacks soon.
With this simple stack, you can build your own Docker images and publish them either locally or through GitHub pipelines. For your own Docker containers, you will need a registry such as Docker Hub or a similar option, like GitHub's container registry.

#### Caution! Caution! This stack is intended for development use only and is not configured for production. For production use, please refer to the "Easy-Stack-Prod" stack - comming soon.

## Important Notice

We strongly recommend changing all passwords in the `.env.dist` file. These are purely test data and should not be used even in development mode.

### How to Update Environment Variables

1. Create a `.env` file next to `.env.dist`:
   ```sh
   cp .env.dist .env
   ```
2. Open the `.env` file and update the relevant values.
3. The `.env` file will be automatically loaded if it exists and will override the corresponding environment variables.

## Installation and Starting the Application
To install and start the application, follow these steps:

### Prerequisites
- Docker and Docker Compose must be installed on the system.

#### Before you run this project, ensure the following are installed on your host system:

- Git
- Docker
- Docker Compose
- Make

#### Build this stack

Clone this Project

```sh
git clone git@github.com:Opillion-GmbH-Co-KG/easy-stack-gitlab.git

cd ./easy-stack-gitlab

 ```

To start and install this stack:

```sh
make start
 ```
or

```sh
make restart
```

#### The stack up and running:

# Docker Compose Setup 

This project provides a setup for various services within a Docker Compose environment. The services are pre-configured and use environment variables defined in a `.env` file.

## Service Overview

### 1. **GitLab**
- **Image:** Custom Build (Dockerfile located in `.docker/gitlab`)
- **Description:** GitLab instance for code hosting and CI/CD.
- **Ports (configured in `.env`):**
   - **HTTP:** `${GITLAB_EXTERNAL_PORT}:${GITLAB_INTERNAL_PORT}` (Default: `8087:8087`)
   - **HTTPS:** `${GITLAB_HTTPS_EXTERNAL_PORT}:${GITLAB_HTTPS_INTERNAL_PORT}` (Default: `8443:443`)
   - **SSH:** `${GITLAB_SSH_EXTERNAL_PORT}:${GITLAB_SSH_INTERNAL_PORT}` (Default: `2224:22`)
- **Environment Variables:**
   - `GITLAB_EXTERNAL_URL`: Base URL of the GitLab instance (Default: `http://gitlab.local:8087`)
   - `GITLAB_USERNAME`: Admin account username (Default: `gitlab_admin`)
   - `GITLAB_EMAIL`: Admin account email (Default: `super-admin@joneddo.de`)
   - `GITLAB_NAME`: Admin account name (Default: `Admin User`)
   - `GITLAB_PASSWORD`: Admin account password (Default: `strongpassword1234`)
   - `GITLAB_PROJECTS_LIMIT`: Maximum number of projects for the admin account (Default: `100`)
- **Volumes:**
   - `./.docker/dev/gitlab/config:/etc/gitlab`
   - `./.docker/dev/gitlab/logs:/var/log/gitlab`
   - `./.docker/dev/gitlab/data:/var/opt/gitlab`
   - `/etc/localtime:/etc/localtime:ro`
   - `/etc/timezone:/etc/timezone:ro`

### 2. **GitLab Runner**
- **Image:** Custom Build (Dockerfile located in `.docker/gitlab-runner`)
- **Description:** GitLab Runner for executing CI/CD jobs.
- **Ports:** No ports configured.
- **Environment Variables:**
   - `RUNNER_NAME`: Runner name (Default: `my-docker-runner`)
   - `REGISTER_NON_INTERACTIVE`: Non-interactive registration (Default: `true`)
   - `REGISTER_LOCKED`: Register in locked state (Default: `false`)
   - `REGISTER_TAG_LIST`: Tags for the runner (Default: `docker,linux`)
   - `RUNNER_EXECUTOR`: Executor type (Default: `docker`)
   - `CI_SERVER_URL`: URL of GitLab instance for CI/CD (Default: `http://gitlab.local:8087`)
   - `REGISTRATION_TOKEN`: Registration token (retrieved from GitLab UI)
   - `DOCKER_IMAGE_GITLAB_RUNNER`: Default Docker image for builds (Default: `alpine:latest`)
   - `DOCKER_PRIVILEGED`: Enable Docker-in-Docker support (Default: `true`)
- **Volumes:**
   - `./.docker/dev/gitlab-runner/config:/etc/gitlab-runner`
   - `/var/run/docker.sock:/var/run/docker.sock`
   - `/etc/localtime:/etc/localtime:ro`
   - `/etc/timezone:/etc/timezone:ro`
- **Depends On:** GitLab service, with health-check condition.

## License Information

| Container           | License               | License Link                                                         |
|---------------------|-----------------------|----------------------------------------------------------------------|
| **GitLab**          | MIT / EE Proprietary  | [GitLab License](https://gitlab.com/gitlab-org/gitlab)               |
| **GitLab Runner**   | MIT                   | [GitLab Runner License](https://gitlab.com/gitlab-org/gitlab-runner) |
| **Easy-Stack**      | GPL-3.0               | [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html)                 |



## This Stack is based on Easy Stack Mini

[![Easy Stack Mini - DALL-E Image](.makefile/assets/easy-stack-mini.jpg?raw=true)](https://github.com/Opillion-GmbH-Co-KG/easy-stack-mini)





