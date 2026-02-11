#!/bin/bash

set -xeu
release=$1

mkosi build -f --release="$release"
podman build -t "ghcr.io/sebatec-eu/$release-forgejo-runner:latest" .
