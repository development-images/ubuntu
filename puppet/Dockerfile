# Ansible development environment

## Use base image
FROM registry.remote.sx/development-images/ubuntu/base:latest

## The puppet release to use
ARG PUPPET_VERSION="puppet7"

## The release name to use for puppet
ARG PUPPET_RELEASE="focal"
ARG PUPPET_TOOLS_RELEASE="focal"

## Switch to root for Puppet installation
USER root

## Install bundler and ruby-dev
RUN apt-get update && apt-get install -y --no-install-recommends \
        bundler ruby-dev \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install gems that will be used
RUN gem install rubocop
RUN gem install r10k
RUN gem install solargraph
RUN gem install puppet-debugger
RUN gem install hiera-eyaml

## Add apt repository and install puppet
RUN wget -q -O /tmp/puppet-release.deb "http://apt.puppetlabs.com/${PUPPET_VERSION}-release-${PUPPET_RELEASE}.deb" \
    && wget -q -O /tmp/puppet-tools.deb "http://apt.puppetlabs.com/puppet-tools-release-${PUPPET_TOOLS_RELEASE}.deb" \
    && dpkg -i /tmp/puppet-release.deb /tmp/puppet-tools.deb \
    && rm -f /tmp/puppet-release.deb /tmp/puppet-tools.deb \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        puppet-agent pdk puppet-lint puppetserver puppet-bolt \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Switch back to vscode user
USER vscode

## Create PDK configuration directory
RUN mkdir -p /home/vscode/.config/puppet

## Copy PDK configuration file to disable analytics
COPY pdk_analytics.yml /home/vscode/.config/puppet/analytics.yml