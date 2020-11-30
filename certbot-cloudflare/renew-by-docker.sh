#!/bin/sh
SHELL_FOLDER=$(dirname $(readlink -f "$0"))

docker run -it --rm --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            -v "${SHELL_FOLDER}/cloudflare.ini:/root/ssl/cloudflare.ini" \
            certbot/dns-cloudflare renew \
            --dns-cloudflare-credentials /root/ssl/cloudflare.ini \

