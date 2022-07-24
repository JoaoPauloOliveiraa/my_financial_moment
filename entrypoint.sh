#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /my-financial-moment-api/tmp/pids/server.pid
bundle check || bundle install
exec "$@"
