# Dockerfile tempate - Supervisor with SSHD

## Load base image
FROM registry.gitlab.com/development-images/debian/stretch:supervisor

## Install sshd
RUN echo \
      ### Update current sources list
      && apt-get update \
      ### Install SSH server
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        openssh-server \
      ### Generate host keys
      && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
      && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N '' \
      && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Add service file
ADD ./sshd.service /etc/supervisord.d/sshd.service