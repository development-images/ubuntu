## Base on Python dev container
FROM registry.remote.sx/development-images/ubuntu/python:latest

## Set the Conda Python version to install
ENV USE_PYTHON_VERSION=3.11

## Create the Conda environment
RUN /home/vscode/conda/bin/conda create -q -y -n development "python=${USE_PYTHON_VERSION}"

## Install pip in PyPy environment
RUN /home/vscode/conda/envs/pypy3.9/bin/python3 -m ensurepip \
    ## Add symlink pip3 -> pip for Poetry to work
    && ln -s /home/vscode/conda/envs/pypy3.9/bin/pip3 /home/vscode/conda/envs/pypy3.9/bin/pip

## Copy create script to install Python requirements
COPY scripts/create.sh /home/vscode/create.sh

## Set the work directory
WORKDIR /code