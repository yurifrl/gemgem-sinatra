#!/bin/bash

docker run --rm -ti \
  -e ENV=development \
  -w /usr/src/app \
  -v $(pwd):/usr/src/app \
  -p 4567:4567 -p 80:80 \
  gemgem-sinatra scripts/inside-container.sh "$@"
