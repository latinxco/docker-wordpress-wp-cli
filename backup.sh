#!/bin/bash
set -e

if [ -z "$WORDPRESS_DB_HOST" ]; then echo "Error: WORDPRESS_DB_HOST not set"; echo "Finished: FAILURE"; exit 1; fi
if [ -z "$WORDPRESS_DB_USER" ]; then echo "Error: WORDPRESS_DB_USER not set"; echo "Finished: FAILURE"; exit 1; fi
if [ -z "$WORDPRESS_DB_NAME" ]; then echo "Error: WORDPRESS_DB_NAME not set"; echo "Finished: FAILURE"; exit 1; fi
if [ -z "$WORDPRESS_DB_PASSWORD" ]; then echo "Error: WORDPRESS_DB_PASSWORD not set"; echo "Finished: FAILURE"; exit 1; fi

echo 'creating ai1wm backup archive of /var/www/html'
wp ai1wm backup --path=/var/www/html

echo 'Finished: SUCCESS'
