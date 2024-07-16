# Puppet development environment
# hadolint global ignore=DL3008

## Create arg for release
ARG RELEASE

## Create default arg for the registry path to pull base image from
ARG REGISTRY_PATH="registry.remote.sx/development-images/ubuntu"

## Use base image
# hadolint ignore=DL3007
FROM ${REGISTRY_PATH}/ruby/${RELEASE}:latest

## The puppet release to use
ARG PUPPET_VERSION="puppet8"

## The release name to use for puppet
ARG PUPPET_RELEASE="noble"
ARG PUPPET_TOOLS_RELEASE="noble"

## Switch to root for Puppet installation
USER root

## Install gems that will be used
# hadolint ignore=DL3028
RUN gem install \
    r10k solargraph puppet-debugger hiera-eyaml

## Add the package sources file
COPY ./puppet.sources /etc/apt/sources.list.d/puppet.sources

## Update package sources and install puppet packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        puppet-agent pdk puppet-lint puppetserver puppet-bolt \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Switch back to vscode user
USER vscode

## Create PDK configuration directory and Puppet configuration directory
RUN mkdir -p /home/vscode/.config/puppet /home/vscode/.puppetlabs/etc/puppet

## Copy PDK configuration file to disable analytics
COPY pdk_analytics.yml /home/vscode/.config/puppet/analytics.yml