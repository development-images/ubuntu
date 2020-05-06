#!/usr/bin/env bash

## Set release to build
RELEASE="latest"

## Make sure required variables are set
if [ -z "$CI_REGISTRY_IMAGE" ]; then
  echo 'CI_REGISTRY_IMAGE environment variable must be defined'
  exit 2
fi
if [ -z "$GITLAB_CI_REGISTRY" ]; then
  echo 'GITLAB_CI_REGISTRY environment variable must be defined'
  exit 2
fi

## Build base Focal docker image
docker build --pull -t "ubuntu/${RELEASE}/base" "./${RELEASE}/base/" || exit 1

## Set tags for pushing image to registries
docker tag "ubuntu/${RELEASE}/base" "${CI_REGISTRY_IMAGE}/${RELEASE}:latest" || exit 1
docker tag "ubuntu/${RELEASE}/base" "${GITLAB_CI_REGISTRY}/${RELEASE}:latest" || exit 1