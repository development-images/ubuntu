## Use base Ubuntu Python 3 image for VS code
FROM registry.gitlab.com/development-images/ubuntu/vscode/lang:python

## Install additional packages
RUN echo \
      ### Install Ansible with pip
      && pip3 install ansible

## Switch to the VS Code user
USER vscode