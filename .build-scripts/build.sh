#!/usr/bin/env bash

echo $CI_REGISTRY_IMAGE

#parallel --env CI_REGISTRY_IMAGE --env GITLAB_CI_REGISTRY -j${PARALLEL_TASKS:-4} ::: .build-scripts/01-base/*.sh
