#!/usr/bin/env bash
#set -x

docker info > /dev/zero 2>&1
r=$?
echo "status: $r"

if [ $r -eq 127 ]
then
   echo "No docker desktop installed"
   brew install --cask docker
   xattr -d -r com.apple.quarantine /Applications/Docker.app
fi

if [ $r -ne 0 ]
then
    i=1
    while ! docker info > /dev/zero 2>&1 ; do

        if pgrep -xq -- "Docker"; then
            echo 'Docker still running'
        else
            echo 'Docker not running, restart'
            open -g -a /Applications/Docker.app/Contents/MacOS/Docker
        fi

        if [[ $i -gt 30 ]]; then
            >&2 echo 'Failed to run Docker'
            exit 1
        fi;
        echo 'Waiting for Docker service to be in the running state'
        ((i=i+1))
        sleep 10
    done
fi

docker start myst
if [ $? -eq 0 ]
then
   echo "Container already started"
else
  echo "Setting up exit node container"
  docker run -it \
     --cap-add NET_ADMIN -d -p 4449:4449 \
     --name myst \
     -v "${HOME}/.mysterium:/var/lib/mysterium-node" \
     --device /dev/net/tun:/dev/net/tun \
     mysteriumnetwork/myst:latest \
     service --agreed-terms-and-conditions
fi
