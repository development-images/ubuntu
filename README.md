# Ubuntu Containers

This repository contains various Ubuntu containers.

## Base Containers

The base containers are used to build variants (see below). The base containers have common utilities installed such as curl, wget, editors etc.

The following images exist:

* `registry.gitlab.com/development-images/ubuntu/focal:latest`: Ubuntu Focal (20.04) - All updates applied, common utilities installed
  * `registry.gitlab.com/development-images/ubuntu/focal:minimal`: Ubuntu Focal (20.04) - Only updates applied
* `registry.gitlab.com/development-images/ubuntu/eoan:latest`: Ubuntu Eoan (19.10) - All updates applied, common utilities installed
  * `registry.gitlab.com/development-images/ubuntu/eoan:minimal`: Ubuntu Eoan (19.10) - Only updates applied
* `registry.gitlab.com/development-images/ubuntu:latest`: Clone of latest Ubuntu release container (currently Focal - 20.04)

These images can be used as the base image in a `Dockerfile` like this:

```
# Dockerfile
FROM registry.gitlab.com/development-images/ubuntu:latest

RUN ...CUSTOM STEPS HERE...
```

## Variants

VS Code development containers are available with various language support. For further information see the [VS Code README.md](/vscode/README.md) file.
