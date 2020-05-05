## Based on official Debian image
FROM debian:stretch AS minimal

LABEL maintainer="Chris <mail@gbe0.com>" \
      repository="https://gitlab.com/development-images/debian" \
      description="Updated Debian Stretch container"

## Configure the mirror to download all packages from (will be inserted to sources list)
ARG APT_MIRROR="deb.debian.org"

## Configure LANG, LC_ALL and LANGUAGE environment vars to prevent various errors
ENV LANG=C LC_ALL=C LANGUAGE=C

## Build image
RUN echo \
      ### Update current sources list and install lsb_release utility
      && apt-get update \
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        lsb-release \
      ### Configure package sources list
      && echo "deb http://${APT_MIRROR}/debian $(lsb_release -sc) main contrib non-free" > /etc/apt/sources.list \
      && echo "deb http://${APT_MIRROR}/debian $(lsb_release -sc)-updates main contrib non-free" >> /etc/apt/sources.list \
      && echo "deb http://${APT_MIRROR}/debian $(lsb_release -sc)-backports main contrib non-free" >> /etc/apt/sources.list \
      && echo "deb http://${APT_MIRROR}/debian-security $(lsb_release -sc)/updates main contrib non-free" >> /etc/apt/sources.list \
      && echo "deb-src http://${APT_MIRROR}/debian $(lsb_release -sc) main contrib non-free" > /etc/apt/sources.list \
      && echo "deb-src http://${APT_MIRROR}/debian $(lsb_release -sc)-updates main contrib non-free" >> /etc/apt/sources.list \
      && echo "deb-src http://${APT_MIRROR}/debian $(lsb_release -sc)-backports main contrib non-free" >> /etc/apt/sources.list \
      && echo "deb-src http://${APT_MIRROR}/debian-security $(lsb_release -sc)/updates main contrib non-free" >> /etc/apt/sources.list \
      ### Update package cache
      && apt-get update \
      ### Perform full system upgrade
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y dist-upgrade \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Create layer for common utilities
FROM minimal AS full

## Set new label
LABEL description="Updated Debian Stretch container with common utilities installed"

## Add standard toolset
RUN echo \
      ### Update package cache
      && apt-get update \
      ### Install standard utils
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        #### Editors/pager
        vim neovim less \
        #### Wget/curl for downloading things
        wget curl \
        #### Networking CLI tools
        dnsutils net-tools iputils-ping tcptraceroute telnet netcat-openbsd \
        #### Shell
        bash bash-completion \
        #### Other
        git \
      ### Install requirements for trusting GPG keys and HTTPS repositories
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        apt-transport-https gnupg \
      ### Create neovim config dir
      && mkdir -p /root/.config/nvim \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Add editor configuration files
COPY ./vimrc /root/.vimrc
COPY ./neovimrc /root/.config/nvim/init.vim

## Create layer for supervisor support
FROM full AS supervisor

## Add startup script
ADD ./start.sh /start.sh

## Add supervisor
RUN echo \
      ### Update package cache
      && apt-get update \
      ### Install pip
      && DEBIAN_FRONTEND="noninteractive" apt-get -q -y install \
        python3-pip \
      ### Install supervisor
      && pip3 install supervisor \
      ### Create supervisor service include directory
      && mkdir /etc/supervisord.d \
      ### Fix startup script permissions
      && chmod +x /start.sh \
      ### Cleanup temporary files
      && rm -rf \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/{apt,cache,dpkg,lists,log}/* \
        /var/tmp/*

## Add the supervisor main configuration file
ADD ./supervisord.conf /etc/supervisord.conf

## Configure the startup command
CMD ["/bin/sh", "/start.sh"]