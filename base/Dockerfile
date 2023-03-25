# Base development environment

## Create arg for release
ARG RELEASE

## Set base Ubuntu image
FROM ubuntu:${RELEASE}

## Set maintainer label
LABEL maintainer="Chris <docker@gbe0.com>"

## Configure the Node repository name
## This will be appended to the URL like https://deb.nodesource.com/node_${NODE_VERSION}.x
## As an example for Node 15.x the URL will look like this: https://deb.nodesource.com/node_15.x/
ARG NODE_VERSION="18"

## Configure default user ID and group ID that will be used for VS Code
ARG UID=1000
ARG GID=$UID

## Configure LANG, LC_ALL and LANGUAGE environment vars to prevent various errors
ENV LANG=C LC_ALL=C LANGUAGE=C

## Configure apt options
ENV DEBIAN_FRONTEND="noninteractive" DEBCONF_NOWARNINGS="yes"

## Set shell options
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

## Install the various utilities and tools that are used in the development environment
RUN apt-get update && apt-get install -y --no-install-recommends \
        ## lsb-release for getting distribution information
        lsb-release \
        ## Shell and shell utilities
        bash-completion zsh zsh-syntax-highlighting ssh \
        ## Connectivity checking and networking tools
        iputils-ping tcptraceroute telnet dnsutils net-tools whois \
        ## Text editors/pagers
        vim neovim less \
        ## HTTP clients
        curl wget \
        ## Development tools
        git jq \
        ## System utilities
        screen tmux strace sudo plocate bsdmainutils \
        ## Build tools
        build-essential \
        ## Language tools
        shellcheck \
        python3 python3-venv python3-pip python3-netaddr python3-dnspython \
        openjdk-11-jdk-headless \
    ## Clean up
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Link "python" -> "python3"
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

## Install Node
RUN curl -fsSL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | bash - \
    && apt-get install -y --no-install-recommends \
        nodejs \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Create configuration directories
RUN mkdir -p /root/.config/nvim

## Install configuration files
COPY vimrc /root/.vimrc
COPY neovimrc /root/.config/nvim/init.vim
COPY .tmux.conf /root/.tmux.conf

## Configure the user that VS Code will run as
RUN groupadd --gid ${GID} vscode \
    && useradd --uid ${UID} --gid ${GID} -s /bin/zsh -m vscode \
    ### Create directories for extensions that are installed by VS Code
    && mkdir -p /home/vscode/.vscode-server /home/vscode/.vscode-server-insiders \
    ### Copy vim config from root user
    && cp /root/.vimrc /home/vscode/.vimrc \
    ### Copy neovim config from root user
    && cp -R /root/.config /home/vscode/.config \
    ### Fix permissions on home directory
    && chown -R ${UID}:${GID} /home/vscode \
    ### Add sudo configuration to allow no password access for vscode user
    && echo vscode ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode \
    ### Add work around for error with sudo 1.8.31
    ### https://github.com/sudo-project/sudo/issues/42
    ### Without this fix, every sudo command gives this error:
    ###   sudo: setrlimit(RLIMIT_CORE): Operation not permitted
    && echo "Set disable_coredump false" >> /etc/sudo.conf

## Install configuration files
COPY .bash_aliases /home/vscode/.bash_aliases
COPY .zshrc /home/vscode/.zshrc
COPY .tmux.conf /home/vscode/.tmux.conf
COPY .ssh /home/vscode/.ssh

## Fix permissions
RUN chown -R vscode:vscode /home/vscode \
    && chmod 600 /home/vscode/.ssh/config

## Switch to the VS Code user
USER vscode

## Install oh-my-zsh
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Set env variable to make git easier to work with when using SSH
ENV GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

## Update $PATH to work with locally installed binaries
ENV PATH="/home/vscode/.local/bin:${PATH}"
