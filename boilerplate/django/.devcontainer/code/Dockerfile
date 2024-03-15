## Base on Django dev container
FROM registry.gitlab.com/development-images/ubuntu/django:latest

## A mirror of the container is available at this alternative registry:
#FROM registry.remote.sx/development-images/ubuntu/django:latest

## Set the Conda Python version to install
ENV USE_PYTHON_VERSION=3.12

## Switch to root
USER root

## Copy startup scripts to container
COPY scripts /usr/local/scripts

## Switch to the VS Code user
USER vscode

## Create the Conda environment
RUN /home/vscode/conda/bin/conda create -q -y -n development "python=${USE_PYTHON_VERSION}"

## Use the development conda environment for shell sessions by default
RUN echo "" >> /home/vscode/.zshrc \
    && echo "conda activate development" >> /home/vscode/.zshrc

## Once your project exists, you can uncomment the following line to set env vars for Django
#ENV DJANGO_SETTINGS_MODULE="my-project.settings" PYTHONPATH="/code/my-project"

## Set the work directory
WORKDIR /code
