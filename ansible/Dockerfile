# Ansible development environment

## Create arg for release
ARG RELEASE

## Use base image
FROM registry.remote.sx/development-images/ubuntu/base/${RELEASE}:latest

## Switch to root for Ansible installation
USER root

## Install locales and generate UTF8 locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && apt-get update && apt-get install -y --no-install-recommends \
        locales \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* \
    && locale-gen en_US.UTF-8

## Set UTF8 locale for Ansible
ENV LANG=en_US.UTF-8 LC_ALL=en_US.utf-8

## Install Ansible from PPA and pipx
RUN wget -qO- "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x6125e2a8c77f2818fb7bd15b93c4a3fd7bb9c367" | apt-key add - \
    && echo "deb https://ppa.launchpadcontent.net/ansible/ansible/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ansible.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ansible pipx \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install related utilities for Ansible from pip
RUN python3 -m pip install --no-cache-dir --break-system-packages \
        ansible-pylibssh ansible-lint ansible-navigator redis yq ncclient molecule

## Install JunOS Ansible collection
RUN ansible-galaxy collection install junipernetworks.junos

## Update zshrc
COPY .zshrc /home/vscode/.zshrc

## Fix zsh permissions
RUN chown -R vscode:vscode /home/vscode/.zshrc

## Switch back to vscode user
USER vscode

## Install JSON schema
RUN pipx install check-jsonschema \
    && pipx inject check-jsonschema 'jsonschema[format]'
