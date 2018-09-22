#!/usr/bin/env bash

set -eu

readonly VERSION='0.9.27'
readonly DIGDAG_LOG_DIR='/var/log/digdag'

docker run -it --rm \
    -p 65432:65432 \
    -v $(pwd):/src \
    --name docker-digdag \
    szyn/docker-digdag:${VERSION} \
    server \
        --memory \
        --task-log ${DIGDAG_LOG_DIR}/sessions \
        --bind 0.0.0.0

### NOTE: Specify access log and server log
# docker run -it --rm \
#     -p 65432:65432 \
#     -v $(pwd):/src \
#     --name docker-digdag \
#     szyn/docker-digdag:${VERSION} \
#     server \
#         --memory \
#         --task-log ${DIGDAG_LOG_DIR}/sessions \
#         --access-log ${DIGDAG_LOG_DIR} \
#         --log ${DIGDAG_LOG_DIR}/server.log \
#         --bind 0.0.0.0