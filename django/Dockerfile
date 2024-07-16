# Django development environment
# hadolint global ignore=DL3008

## Create arg for release
ARG RELEASE

## Create default arg for the registry path to pull base image from
ARG REGISTRY_PATH="registry.remote.sx/development-images/ubuntu"

## Use Python base image
# hadolint ignore=DL3007
FROM ${REGISTRY_PATH}/python/${RELEASE}:latest

## Switch to root
USER root

## Install development headers for database extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        libmariadb-dev-compat postgresql-client postgresql-server-dev-16 \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install watchman
RUN apt-get update && apt-get install -y --no-install-recommends \
        watchman \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Switch back to vscode user
USER vscode