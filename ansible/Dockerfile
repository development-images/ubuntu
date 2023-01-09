# Ansible development environment

## Use base image
FROM registry.remote.sx/development-images/ubuntu/base:latest

## Install Ansible
USER root

RUN wget -qO- "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x6125e2a8c77f2818fb7bd15b93c4a3fd7bb9c367" | apt-key add - \
    && echo "deb https://ppa.launchpadcontent.net/ansible/ansible/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ansible.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ansible \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m pip install --no-cache-dir \
        ansible-pylibssh ansible-lint ansible-navigator redis yq ncclient \
    && ansible-galaxy collection install junipernetworks.junos

USER vscode

## Install JSON schema
RUN pipx install check-jsonschema \
    && pipx inject check-jsonschema 'jsonschema[format]'

## Update zshrc
COPY .zshrc /home/vscode/.zshrc
