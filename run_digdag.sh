#!/usr/bin/env bash

set -eu

readonly VERSION='0.9.27'

docker run -it --rm \
    -p 65432:65432 \
    -v $(pwd):/src \
    --name docker-digdag \
    szyn/docker-digdag:${VERSION} \
    server -m -b 0.0.0.0