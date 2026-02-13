#!/bin/bash

set -xeu

release=$1
baseurl=/orgs/sebatec-eu/packages/container/${release}-forgejo-runner/versions

image_ids=$(gh api "${baseurl}" -H "Accept: application/vnd.github.packages-preview+json" -q '.[] | select(.metadata.container.tags|length==0) | {id: .id, tags: .metadata.container.tags|length} | .id')

for id in ${image_ids:-}; do
    gh api "${baseurl}/${id}" --method DELETE -H "Accept: application/vnd.github+json" || true
done
