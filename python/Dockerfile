# Python development environment
# hadolint global ignore=DL3008

## Create arg for release
ARG RELEASE

## Create default arg for the registry path to pull base image from
ARG REGISTRY_PATH="registry.remote.sx/development-images/ubuntu"

## Use base image
# hadolint ignore=DL3007
FROM ${REGISTRY_PATH}/base/${RELEASE}:latest

## Switch to root
USER root

## Install python linting tools from Debian packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-autopep8 python3-flake8 python3-pycodestyle pylint python3-mypy python3-mypy-extensions \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install other python tools from Debian packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-dnspython python3-ipython pipenv pipx \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Install common Python tools from pip
# hadolint ignore=DL3013
RUN python3 -m pip install --no-cache-dir --break-system-packages \
    black ipykernel pandas ruff

## Update zshrc
COPY .zshrc /home/vscode/.zshrc

## Fix zsh permissions
RUN chown -R vscode:vscode /home/vscode/.zshrc

## Switch back to vscode user
USER vscode

## Install semgrep
# hadolint ignore=DL3013
RUN pipx install semgrep

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

## Install Poetry
# hadolint ignore=DL4001,DL4006
RUN curl -sSL https://install.python-poetry.org | python3 - \
    && poetry config virtualenvs.create false \
    ### Add ZSH plugin
    && mkdir /home/vscode/.oh-my-zsh/custom/plugins/poetry \
    && poetry completions zsh > /home/vscode/.oh-my-zsh/custom/plugins/poetry/_poetry \
    ### Add "poetry up" plugin
    && poetry self add poetry-plugin-up
