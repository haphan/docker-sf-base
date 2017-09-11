#!/bin/bash
set -xe

REGISTRY="registry.hybridportal.cloud"

VERSION_AUTO=`date +"%y%m%d.%H%M"`
VERSION=${VERSION:-$VERSION_AUTO}

TAG="sttc/sf-base:${VERSION}"
TAG_LATEST="sttc/sf-base:latest"
IMAGE="${REGISTRY}/${TAG}"
IMAGE_LATEST="${REGISTRY}/${TAG_LATEST}"

docker build -t "${IMAGE}" -t "${IMAGE_LATEST}" --no-cache . \
&& docker push "${IMAGE}" && docker push "${IMAGE_LATEST}"

echo Done building "${IMAGE}"
