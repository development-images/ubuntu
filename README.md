# Ubuntu Containers

This repository contains various Ubuntu containers.

## Base Containers

The base containers are used to build variants (see below). The base containers have common utilities installed such as curl, wget, editors etc.

The following images exist:

* `git.remote.sx:4567/docker-base/ubuntu/focal:latest`: Ubuntu Focal (20.04)
* `git.remote.sx:4567/docker-base/ubuntu/eoan:latest`: Ubuntu Eoan (19.10)
* `git.remote.sx:4567/docker-base/ubuntu:latest`: Clone of latest Ubuntu release container (currently Focal - 20.04)

These images can be used as the base image in a `Dockerfile` like this:

```
# Dockerfile
FROM git.remote.sx:4567/docker-base/ubuntu:latest

RUN ...
```

## Variants

VS Code development containers are available with various language support. For further information see [the README.md file](/vscode/README.md).
