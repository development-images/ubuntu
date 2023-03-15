# Python development environment

## Create arg for release
ARG RELEASE

## Use base image
FROM registry.remote.sx/development-images/ubuntu/base/${RELEASE}:latest

## Switch to root
USER root

## Install python linting tools from Debian packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-autopep8 python3-flake8 python3-pycodestyle pylint \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install other python tools from Debian packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-dnspython python3-ipython pipenv \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install common Python tools from pip
RUN python3 -m pip install --no-cache-dir \
    black ipykernel pandas click

## Update zshrc
COPY .zshrc /home/vscode/.zshrc

## Fix zsh permissions
RUN chown -R vscode:vscode /home/vscode/.zshrc

## Switch back to vscode user
USER vscode

## Install pipx
RUN python3 -m pip install --no-cache-dir --user pipx

## Install Conda
RUN wget -qO /tmp/miniconda-install.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash /tmp/miniconda-install.sh -b -p /home/vscode/conda \
    && rm -f /tmp/miniconda-install.sh \
    ### Upgrade conda
    && /home/vscode/conda/bin/conda update conda -q -y \
    ### Setup shell
    && /home/vscode/conda/bin/conda init bash \
    && /home/vscode/conda/bin/conda init zsh \
    ### Don't enable conda environment by default
    && /home/vscode/conda/bin/conda config --set auto_activate_base false \
    ### Enable pypy repository (conda-forge)
    && /home/vscode/conda/bin/conda config --add channels conda-forge \
    && /home/vscode/conda/bin/conda config --set channel_priority strict

## Install Conda ZSH completion
RUN git clone --depth=1 https://github.com/esc/conda-zsh-completion /home/vscode/.oh-my-zsh/custom/plugins/conda-zsh-completion

### Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - \
    && poetry config virtualenvs.create false

## Install Poetry ZSH plugin
RUN mkdir /home/vscode/.oh-my-zsh/custom/plugins/poetry \
    && poetry completions zsh > /home/vscode/.oh-my-zsh/custom/plugins/poetry/_poetry
