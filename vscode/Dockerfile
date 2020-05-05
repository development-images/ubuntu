## Based on latest Ubuntu image
FROM registry.gitlab.com/development-images/ubuntu:latest as base

LABEL description="Latest Ubuntu release with common development environment setup for VS Code"

## Configure the Node repository name
## This will be appended to the URL like https://deb.nodesource.com/node_${NODE_VERSION}.x
## As an example for Node 14.x the URL will look like this: https://deb.nodesource.com/node_14.x/
ARG NODE_VERSION="14"

## Configure default user ID and group ID that will be used for the VS Code user
ARG UID=1000
ARG GID=$UID

## Install development tools
RUN echo \
      ### Update current sources list
      && apt-get update \
      ### Install useful CLI tools
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        #### Multiplexors
        screen tmux \
        #### Sudo
        sudo \
      ### Add work around for error with sudo 1.8.31
      ### https://github.com/sudo-project/sudo/issues/42
      ### Without this fix, every sudo command gives this error:
      ###   sudo: setrlimit(RLIMIT_CORE): Operation not permitted
      && echo "Set disable_coredump false" >> /etc/sudo.conf \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Install Node
RUN echo \
      ### Trust the node.js GPG key
      && wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
      ### Add the package repository
      && echo "deb https://deb.nodesource.com/node_${NODE_VERSION}.x $(lsb_release -sc) main" > /etc/apt/sources.list.d/nodesource.list \
      ### Update package sources
      && apt-get update \
      ### Install Node
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        nodejs \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Configure the user that VS Code will run as
RUN echo \
      ### Add user and group
      && groupadd --gid ${GID} vscode \
      && useradd --uid ${UID} --gid ${GID} -s /bin/bash -m vscode \
      ### Create directories for extensions that are installed by VS Code
      && mkdir -p /home/vscode/.vscode-server /home/vscode/.vscode-server-insiders \
      ### Create puppet configuration directory
      && mkdir -p /home/vscode/.puppetlabs/etc/puppet \
      ### Copy vim config from root user
      && cp /root/.vimrc /home/vscode/.vimrc \
      ### Copy neovim config from root user
      && cp -R /root/.config /home/vscode/.config \
      ### Fix permissions on home directory
      && chown -R ${UID}:${GID} /home/vscode \
      ### Add sudo configuration to allow no password access for vscode user
      && echo vscode ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/vscode \
      && chmod 0440 /etc/sudoers.d/vscode

## Add the bash aliases file
COPY .bash_aliases /home/vscode/.bash_aliases

## Build common language support
FROM base AS full

## Update tag
LABEL description="Latest Ubuntu release with setup for development with Perl, Python, Shell, PHP and Ruby for VS Code"

## Install requirements
RUN echo \
      ### Update current sources list
      && apt-get update \
      ### Install common language files
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        #### Perl
        perl perl-doc libperl-critic-perl perltidy libyaml-perl \
        #### Python
        python3 python3-pip \
        #### Ruby
        rubocop bundler \
        #### PHP
        php-cli \
        #### Shell
        shellcheck \
      ### Install JDK/JRE (needed for Sonarlint)
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        openjdk-11-jdk-headless openjdk-11-jre-headless \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Install common Python extensions with pip
RUN echo \
      pip3 --no-cache-dir install \
        #### For docker extensions
        docker docker-compose \
        #### Unit testing
        pytest pytest-html \
        #### Linting tools
        pylint autopep8 flake8 pipenv \
        #### Web
        flask falcon Django tornado \
        #### Database
        mysql-connector \
        #### Templating
        jinja2 \
        #### Network
        paramiko \
        #### Logging/output
        colorlog prettyprinter \
        #### Misc
        dnspython requests numpy cerberus pyyaml

## Build Python variant
FROM base AS python

## Update tag
LABEL description="Latest Ubuntu release with setup for development with Python for VS Code"

## Install requirements
RUN echo \
      ### Update current sources list
      && apt-get update \
      ### Install common language files
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        #### Python
        python3 python3-pip \
      ### Install JDK/JRE (needed for Sonarlint)
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        openjdk-11-jdk-headless openjdk-11-jre-headless \
      ### Fix symlinks so that Python 3 is always used
      && rm -f /usr/bin/pip /usr/bin/python \
      && ln -s /usr/bin/python3 /usr/bin/python \
      && ln -s /usr/bin/pip3 /usr/bin/pip \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Install common Python extensions with pip
RUN echo \
      pip3 --no-cache-dir install \
        #### For docker extensions
        docker docker-compose \
        #### Unit testing
        pytest pytest-html \
        #### Linting tools
        pylint autopep8 flake8 pipenv \
        #### Web
        flask falcon Django tornado \
        #### Database
        mysql-connector \
        #### Templating
        jinja2 \
        #### Network
        paramiko \
        #### Logging/output
        colorlog prettyprinter \
        #### Misc
        dnspython requests numpy cerberus pyyaml

## Build Perl variant
FROM base AS perl

## Update tag
LABEL description="Latest Ubuntu release with setup for development with Perl for VS Code"

## Install requirements
RUN echo \
      ### Update current sources list
      && apt-get update \
      ### Install common language files
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        #### Perl
        perl perl-doc libperl-critic-perl perltidy libyaml-perl \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Build PHP variant
FROM base AS php

## Update tag
LABEL description="Latest Ubuntu release with setup for development with PHP for VS Code"

## Install requirements
RUN echo \
      ### Update current sources list
      && apt-get update \
      ### Install common language files
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        #### PHP
        php-cli \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Build Shell variant
FROM base AS shell

## Update tag
LABEL description="Latest Ubuntu release with setup for development with Shell for VS Code"

## Install requirements
RUN echo \
      ### Update current sources list
      && apt-get update \
      ### Install common language files
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        #### Shell
        shellcheck \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*