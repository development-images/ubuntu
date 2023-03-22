# Python Development Container

This development container boilerplate is suitable for Python projects.

## Usage

- Edit the file [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json) and add/remote extensions.
- Edit the file [.devcontainer/docker/Dockerfile](.devcontainer/docker/Dockerfile) and use Conda to install the relevant environment(s).
- Edit the file [.devcontainer/docker/scripts/create.sh](.devcontainer/docker/scripts/create.sh) and add any post setup scripts for the environment. This script will only be ran on initial container creation.
