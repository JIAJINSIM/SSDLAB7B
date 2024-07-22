#!/usr/bin/env sh

set -x
docker stop my-apache-php-app || true
docker rm my-apache-php-app || true

# Use simplified path for testing
docker run -d -p 80:80 --name my-apache-php-app -v /c/Users/dclit/temp-html:/var/www/html php:7.2-apache

# Sleep to allow the container to start
sleep 5

# List the files in the container to verify
docker exec my-apache-php-app ls -la /var/www/html

set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'
