# Ubuntu Containers

This repository contains various Ubuntu containers for use with [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers). These containers are **not** designed to be lightweight; they contain a common set of tools that I use and don't want to have to bother installing for each of my development environments.

The containers are built on schedule every 4 days.

- [Ubuntu Containers](#ubuntu-containers)
  - [Containers](#containers)
    - [Additional Tags](#additional-tags)
  - [Dev Container Configurations](#dev-container-configurations)
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

| Base Container |                  README                  |                                           Description                                            |
| -------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Ansible        | [README](/boilerplate/ansible/README.md) | Boiler plate files for an Ansible project. Includes Ansible configuration default configuration. |
| Python         | [README](/boilerplate/python/README.md)  | Python development container. Various linting tools included in dev container extensions.        |
| Ruby           | [README](/boilerplate/ruby/README.md)    | Ruby development container.                                                                      |

## Suggestions? Ideas?

If you make use of the containers and have anything that you would like to add please let me know.
