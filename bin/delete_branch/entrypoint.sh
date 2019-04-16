#!/bin/sh

set -eu

ruby /lib/main.rb

# Run any commands passed
if [ $# -ne 0 ]; then
  exec "$@"
fi
