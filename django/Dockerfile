# Django development environment

## Create arg for release
ARG RELEASE

## Use Python base image
FROM registry.remote.sx/development-images/ubuntu/python/${RELEASE}:latest

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