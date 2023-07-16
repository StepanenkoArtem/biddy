#!/bin/sh

set -e

# If the database exists, migrate. Otherwise setup (create and migrate)
# bundle exec rake db:exists && bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
rm -f /biddy/tmp/pids/server.pid
bundle install sidekiq

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

