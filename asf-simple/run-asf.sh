#!/bin/bash
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
docker run -v ${SHELL_FOLDER}/config:/app/config -d --name asf justarchi/archisteamfarm