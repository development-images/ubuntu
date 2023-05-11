# Ubuntu Containers

This repository contains various Ubuntu containers for use with [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers). These containers are **not** designed to be lightweight; they contain a common set of tools that I use and don't want to have to bother installing for each of my development environments.

The containers are built on schedule every 4 days.

- [Ubuntu Containers](#ubuntu-containers)
  - [Containers](#containers)
    - [Additional Tags](#additional-tags)
  - [Dev Container Configurations](#dev-container-configurations)
  - [Docker in Docker](#docker-in-docker)
    - [Installing Docker](#installing-docker)
    - [Docker Compose Modification](#docker-compose-modification)
  - [Suggestions? Ideas?](#suggestions-ideas)

## Containers

The following container images are available:

| Name    | Description                                                             | Container                                                      |
| ------- | ----------------------------------------------------------------------- | -------------------------------------------------------------- |
| Base    | Base container that all images inherit from. Not very useful by itself. | `registry.gitlab.com/development-images/ubuntu/base:latest`    |
| Ansible | Container with Ansible installed.                                       | `registry.gitlab.com/development-images/ubuntu/ansible:latest` |
| Python  | Container with Python, Conda and Poetry installed.                      | `registry.gitlab.com/development-images/ubuntu/python:latest`  |
| Ruby    | Container with Ruby and bundler installed.                              | `registry.gitlab.com/development-images/ubuntu/ruby:latest`    |

Additionally, the following containers are build based on the above containers:

| Name   | Base   | Description                                                                | Container                                                     |
| ------ | ------ | -------------------------------------------------------------------------- | ------------------------------------------------------------- |
| Django | Python | Container for use with Django (comes with MySQL and PostgreSQL libraries). | `registry.gitlab.com/development-images/ubuntu/django:latest` |
| Puppet | Ruby   | Container for Ruby development.                                            | `registry.gitlab.com/development-images/ubuntu/puppet:latest` |

These tags will always point to the current Ubuntu release (LTS or not).

### Additional Tags

Additional tags are available for each container that are pinned to a specific Ubuntu release. There are two tags available:

- The current LTS release (Jammy)
- The current short term release (Lunar)

| Name    | Jammy                                                                | Lunar                                                                |
| ------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Base    | `registry.gitlab.com/development-images/ubuntu/base/jammy:latest`    | `registry.gitlab.com/development-images/ubuntu/base/lunar:latest`    |
| Ansible | `registry.gitlab.com/development-images/ubuntu/ansible/jammy:latest` | `registry.gitlab.com/development-images/ubuntu/ansible/lunar:latest` |
| Django  | `registry.gitlab.com/development-images/ubuntu/django/jammy:latest`  | `registry.gitlab.com/development-images/ubuntu/django/lunar:latest`  |
| Puppet  | `registry.gitlab.com/development-images/ubuntu/puppet/jammy:latest`  | **N/A** - Not supported                                              |
| Python  | `registry.gitlab.com/development-images/ubuntu/python/jammy:latest`  | `registry.gitlab.com/development-images/ubuntu/python/lunar:latest`  |
| Ruby    | `registry.gitlab.com/development-images/ubuntu/ruby/jammy:latest`    | `registry.gitlab.com/development-images/ubuntu/ruby/lunar:latest`    |

## Dev Container Configurations

Boiler plate dev container configuration files are available for some of the development containers. **You should review the relevant files before use.**

It is recommended to use the boiler plate configuration files with the containers as they will install relevant VS Code extensions.

| Base Container |                  README                  |                                            Description                                             |
| -------------- | ---------------------------------------- | -------------------------------------------------------------------------------------------------- |
| Ansible        | [README](/boilerplate/ansible/README.md) | Boiler plate files for an Ansible project. Includes Ansible configuration default configuration.   |
| Django         | [README](/boilerplate/django/README.md ) | Boiler plate files for a Django project. A Postgres container will also be started.                |
| Node           | [README](/boilerplate/node/README.md)    | Boiler plate files for a Node.js project.                                                          |
| Python         | [README](/boilerplate/python/README.md)  | Python development container. Various linting tools included in dev container extensions.          |
| Python (PyPy)  | [README](/boilerplate/pypy/README.md)    | Same as the Python container except using the [PyPy](https://www.pypy.org/) Python implementation. |
| Ruby           | [README](/boilerplate/ruby/README.md)    | Ruby development container.                                                                        |

## Docker in Docker

If developing an application with Docker and you would like to use Docker inside the development container (Docker in Docker) you will need to modify the `Dockerfile` for the development container as well as the `docker-compose.yaml` file.

### Installing Docker

An example `Dockerfile` (located in `.devcontainer/docker/Dockerfile`) which will install Docker and the Compose plugin:

```dockerfile
## Base on base dev container which already includes node
FROM registry.gitlab.com/development-images/ubuntu/base:latest

## A mirror of the container is available at this alternative registry:
#FROM mirror.remote.sx/development-images/ubuntu/base:latest

## Switch to root user
USER root

## Install Docker
RUN apt-get update && apt-get install -y \
        ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt update \
    && apt -y install \
        docker-ce docker-ce-cli containerd.io docker-compose-plugin \
    ## Clean up
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* \
    ## Add vscode user to docker group
    && usermod -aG docker vscode

## Switch back to vscode user
USER vscode

## Set the work directory
WORKDIR /code
```

### Docker Compose Modification

The Docker socket needs to be mounted in the development container. Modify the volumes in `.devcontainer/docker-compose.yaml` to include a mount for `/var/run/docker.sock` (mounted to the same path). As an example:

```yaml
---

# Docker compose VS Code development file
version: '3.8'

services:

  code:
    build:
      context: ./docker
    restart: "no"
    volumes:
      ## Mount the development container to /code
      - ..:/code
      ## Mount a volume containing the VS code extensions to prevent having to install them each rebuild
      ## A volume will be created for both VS Code and VS Code Insiders edition
      - code-ext:/home/vscode/.vscode-server
      - code-ext-insiders:/home/vscode/.vscode-server-insiders
      ## Mount docker socket for docker in docker
      - /var/run/docker.sock:/var/run/docker.sock
    tty: true

## Define the named volumes that are used for the above services
volumes:
  code-ext:
  code-ext-insiders:
```

## Suggestions? Ideas?

If you make use of the containers and have anything that you would like to add please let me know.
