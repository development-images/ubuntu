## Base on Python dev container
FROM registry.gitlab.com/development-images/ubuntu/python:latest

## Set the Conda Python version to install
ENV USE_PYTHON_VERSION=3.11

## Create the Conda environment
RUN /home/vscode/conda/bin/conda create -q -y -n development "python=${USE_PYTHON_VERSION}"

## Copy create script to install Python requirements
COPY scripts/create.sh /home/vscode/create.sh

## Use the development conda environment for shell sessions by default
RUN echo "conda activate development" >> /home/vscode/.zshrc

## Set the work directory
WORKDIR /code