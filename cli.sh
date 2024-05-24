#!/bin/bash

if [ "$1" = "dev" ]; then
    ./scripts/dev_watch.sh src/main.lua
elif [ "$1" = "install" ]; then
    ./scripts/install.sh
else
    ./scripts/serve.sh
fi
