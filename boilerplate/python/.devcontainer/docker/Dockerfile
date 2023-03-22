## Base on Python dev container
FROM registry.remote.sx/development-images/ubuntu/python:latest

## Create Python 3.11 and PyPy 3.9 environments with Conda
RUN /home/vscode/conda/bin/conda create -q -y -n python3.11 python=3.11 \
    && /home/vscode/conda/bin/conda create -q -y -n pypy3.9 pypy3.9

## Install pip in PyPy environment
RUN /home/vscode/conda/envs/pypy3.9/bin/python3 -m ensurepip \
    ## Add symlink pip3 -> pip for Poetry to work
    && ln -s /home/vscode/conda/envs/pypy3.9/bin/pip3 /home/vscode/conda/envs/pypy3.9/bin/pip

## Copy create script to install Python requirements
COPY scripts/create.sh /home/vscode/create.sh

## Set the Conda Python environment to use in the create script
ENV USE_CONDA_ENV=python3.11

## Set the work directory
WORKDIR /code