#!/usr/bin/env bash

docker run -it \
   --cap-add NET_ADMIN -d -p 4449:4449 \
   --name myst \
   -v "$(pwd)/.myst-data:/var/lib/mysterium-node" \
   --device /dev/net/tun:/dev/net/tun \
   mysteriumnetwork/myst:latest \
   service --agreed-terms-and-conditions
