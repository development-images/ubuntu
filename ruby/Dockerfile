# Ruby development environment
# hadolint global ignore=DL3008

## Create arg for release
ARG RELEASE

## Create default arg for the registry path to pull base image from
ARG REGISTRY_PATH="registry.remote.sx/development-images/ubuntu"

## Use base image
# hadolint ignore=DL3007
FROM ${REGISTRY_PATH}/base/${RELEASE}:latest

## Switch to root for Ruby installation
USER root

## Install bundler and ruby-dev
RUN apt-get update && apt-get install -y --no-install-recommends \
        bundler ruby-dev \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Add common development headers for building gems
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libyaml-dev libssl-dev libffi-dev zlib1g-dev libreadline-dev \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install rubocop and solargraph from gem
RUN gem install rubocop solargraph

## Add user ruby bin to $PATH
ENV PATH="/home/ruby/.gem/ruby/3.0.0/bin:${PATH}"

## Switch back to vscode user
USER vscode