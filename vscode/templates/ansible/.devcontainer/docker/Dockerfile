## Use base debian Python 3 image for VS code
FROM registry.gitlab.com/development-images/debian/vscode/lang:python

## Install additional packages
RUN echo \
      ### Install Ansible with pip
      && pip3 install ansible

## Switch to the VS Code user
USER vscode