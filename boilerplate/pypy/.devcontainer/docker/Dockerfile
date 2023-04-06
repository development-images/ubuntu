## Base on Python dev container
FROM registry.gitlab.com/development-images/ubuntu/python:latest

## Set the Conda Python version to install
ENV USE_PYTHON_VERSION=3.9

## Create the Conda environment
RUN /home/vscode/conda/bin/conda create -q -y -n development "pypy${USE_PYTHON_VERSION}"

## Install pip in PyPy environment
RUN /home/vscode/conda/envs/development/bin/python3 -m ensurepip \
    ## Add symlink pip3 -> pip for Poetry to work
    && ln -s /home/vscode/conda/envs/development/bin/pip3 /home/vscode/conda/envs/development/bin/pip

## Copy create script to install Python requirements
COPY scripts/create.sh /home/vscode/create.sh

## Use the development conda environment for shell sessions by default
RUN echo "conda activate development" >> /home/vscode/.zshrc

## Set the work directory
WORKDIR /code