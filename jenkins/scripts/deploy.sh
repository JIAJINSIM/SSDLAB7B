#!/usr/bin/env sh

set -x
docker-compose down

# Start the service using docker-compose
docker-compose up -d

# Sleep to allow the container to start
sleep 5

# Change permissions inside the container
docker-compose exec web sh -c 'chmod -R 755 /var/www/html'

# List the files in the container to verify
docker-compose exec web ls -la /var/www/html

set +x

echo 'Now...'
echo 'Visit http://localhost:8081 to see your PHP application in action.'
