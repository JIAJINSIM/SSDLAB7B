#!/usr/bin/env sh

set -x
# Stop and remove any existing containers
docker stop my-apache-php-app || true
docker rm my-apache-php-app || true

# Run the container with the correct volume path
docker run -d -p 80:80 --name my-apache-php-app -v /c/Users/dclit/OneDrive/Documents/GitHub/SSDLAB7B/jenkins/scripts/src/src:/var/www/html php:7.2-apache

# Give it a moment to start up
sleep 1
set +x

# Print a message to visit the application
echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'

# Verify if the container is running
docker ps
