#!/usr/bin/env bash

set -eu

OMEROHOST=${OMEROHOST:-omero}
REDISHOST=${REDISHOST:-redis}

sed -i -re "s/(\"uri\":\s*\"redis:\/\/).*(@).*(:6379\/0\")/\1$REDIS_PASSWORD\2$REDISHOST\3/" /opt/omero/ms/omero-ms-thumbnail/conf.json
sed -i -re "s/(\"host\":\s*\").*(\",)/\1$OMEROHOST\2/" /opt/omero/ms/omero-ms-thumbnail/conf.json

/opt/omero/ms/omero-ms-thumbnail/bin/omero-ms-thumbnail -conf /opt/omero/ms/omero-ms-thumbnail/conf.json
