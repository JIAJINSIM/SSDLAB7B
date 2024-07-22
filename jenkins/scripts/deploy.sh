#!/usr/bin/env sh

set -x
# Stop and remove any existing containers
docker stop my-apache-php-app || true
docker rm my-apache-php-app || true
docker run -d -p 80:80 --name my-apache-php-app -v C:\\Users\\dclit\\OneDrive\\Documents\\GitHub\\SSDLAB7B\\jenkins\\scripts\\src:/var/www/html php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'

