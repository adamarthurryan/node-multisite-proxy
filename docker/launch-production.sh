#!/bin/bash

# launch the mean docker container to execute a single command on the working directory
# the working directory will be mounted as /working in the docker container


# test if the data-docker-home container has been created
if docker inspect -f {{.Name}} data-docker-home > /dev/null
  then
    echo > /dev/null
  else
    echo "* creating data-docker-home container"
    echo
    # The data container has a volume at /home/docker, is named 'data' and is based on busybox
    docker create -v /home/docker --name data-docker-home adamarthurryan/mean echo "Data container - docker home"

fi

echo Run this script from the project root folder!

docker run -it --rm -e "PORT=8080" --volumes-from=data-docker-home -v ${PWD}:/working -w /working -p 80:8080 adamarthurryan/mean node proxy.js
