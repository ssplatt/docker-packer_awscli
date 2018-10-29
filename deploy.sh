#!/usr/bin/env bash
set -e

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

COMMIT_NUM=$(git rev-list --count --first-parent HEAD)
VERSION=1.${COMMIT_NUM}

echo "Building docker images for packer_awscli ${VERSION}..."
docker build -t ssplatt/packer_awscli:${VERSION} .
docker tag ssplatt/packer_awscli:${VERSION} ssplatt/packer_awscli:latest

echo "Uploading docker images for packer_awscli ${VERSION}..."
docker push ssplatt/packer_awscli:${VERSION}
docker push ssplatt/packer_awscli:latest
