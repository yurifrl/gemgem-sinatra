#!/bin/bash

if [ -f "scripts/$@.sh" ]; then
  echo "-----> Runnig scripts/$@.sh"
  sh scripts/$@.sh
else
  echo "-----> Runnig $@"
  $@
fi
