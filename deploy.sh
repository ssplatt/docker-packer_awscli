#!/usr/bin/env bash
set -e

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

COMMIT_NUM=$(git rev-list --count --first-parent HEAD)
version=1.${COMMIT_NUM}

echo "Building docker images for packer_awscli ${version}..."
docker build -f "${base}/Dockerfile" -t ssplatt/packer_awscli:${version} .
docker tag ssplatt/packer_awscli:${version} ssplatt/packer_awscli:latest

echo "Uploading docker images for packer_awscli ${version}..."
docker push ssplatt/packer_awscli:${version}
docker push ssplatt/packer_awscli:latest
