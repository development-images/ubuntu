# Ruby development environment

## Create arg for release
ARG RELEASE

## Use base image
FROM registry.remote.sx/development-images/ubuntu/base/${RELEASE}:latest

## Switch to root for Ruby installation
USER root

## Install bundler and ruby-dev
RUN apt-get update && apt-get install -y --no-install-recommends \
        bundler ruby-dev \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install rubocop from gem
RUN gem install rubocop

## Switch back to vscode user
USER vscode