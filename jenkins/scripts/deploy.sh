#!/usr/bin/env sh

set -x
docker stop my-apache-php-app || true
docker rm my-apache-php-app || true
docker run  -p 80:80 --name my-apache-php-app -v /c/Users/dclit/OneDrive/Documents/GitHub/SSDLAB7B/jenkins/scripts/src:/var/www/html php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'
