# Debian Containers

This repository contains various Debian containers.

## Base Containers

The base containers are used to build variants (see below). The base containers have common utilities installed such as curl, wget, editors etc.

The following images exist:

* `registry.gitlab.com/development-images/debian/buster:latest`: Debian Buster - All updates applied, common utilities installed
  * `registry.gitlab.com/development-images/debian/buster:minimal`: Debian Buster - Only updates applied
* `registry.gitlab.com/development-images/debian/bullseye:latest`: Debian Bullseye - All updates applied, common utilities installed
  * `registry.gitlab.com/development-images/debian/bullseye:minimal`: Debian Bullseye - Only updates applied
* `registry.gitlab.com/development-images/debian/stretch:latest`: Debian stretch - All updates applied, common utilities installed
  * `registry.gitlab.com/development-images/debian/stretch:minimal`: Debian stretch - Only updates applied
* `registry.gitlab.com/development-images/debian/sid:latest`: Debian sid - All updates applied, common utilities installed
  * `registry.gitlab.com/development-images/debian/sid:minimal`: Debian sid - Only updates applied
* `registry.gitlab.com/development-images/debian:latest`: Clone of latest Debian release container (currently Buster)

These images can be used as the base image in a `Dockerfile` like this:

```dockerfile
# Dockerfile
FROM registry.gitlab.com/development-images/debian:latest

RUN ...CUSTOM STEPS HERE...
```

## Variants

VS Code development containers are available with various language support. For further information see the [VS Code README.md](/vscode/README.md) file.
