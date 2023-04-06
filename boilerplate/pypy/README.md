# Python (PyPy) Development Container

This development container boilerplate is suitable for Python projects using the [PyPy](https://www.pypy.org/) Python implementation.

## Usage

- Edit the file [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json) and add/remove extensions.
- Edit the file [.devcontainer/docker/Dockerfile](.devcontainer/docker/Dockerfile) and use Conda to install the relevant environment(s).
- Edit the file [.devcontainer/docker/scripts/create.sh](.devcontainer/docker/scripts/create.sh) and add any post setup scripts for the environment. This script will only be ran on initial container creation.

## Poetry/pyproject.toml

An [example pyproject.toml](pyproject.toml) file has been included. The file should be edited to add the requirements for your project/define the other configuration.

When the container is created for the first time the [create.sh](.devcontainer/docker/scripts/create.sh) script will be executed which will install the various requirements for you.
