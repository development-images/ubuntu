#!/usr/bin/env bash

## Make sure required variables are set
if [ -n "$CI_REGISTRY_IMAGE" ]; then
  echo 'CI_REGISTRY_IMAGE environment variable must be defined'
  exit 2
fi
if [ -n "$GITLAB_CI_REGISTRY" ]; then
  echo 'GITLAB_CI_REGISTRY environment variable must be defined'
  exit 2
fi

## Set release to build
RELEASE="focal"

## Build base Focal docker image
docker build --pull -t "ubuntu/${RELEASE}/base:latest" "./${RELEASE}/base/" || exit 1

## Set tags for pushing image to registries
docker tag "ubuntu/${RELEASE}/base:latest" "${CI_REGISTRY_IMAGE}:latest" || exit 1
docker tag "ubuntu/${RELEASE}/base:latest" "${GITLAB_CI_REGISTRY}:latest" || exit 1

docker tag "ubuntu/${RELEASE}/base:latest" "${CI_REGISTRY_IMAGE}/${RELEASE}:latest" || exit 1
docker tag "ubuntu/${RELEASE}/base:latest" "${GITLAB_CI_REGISTRY}/${RELEASE}:latest" || exit 1