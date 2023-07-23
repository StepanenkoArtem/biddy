#!/bin/sh

set -e

rm -f /biddy/app/tmp/pids/server.pid

 # bin/bundle binstubs rake

# bundle install

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

