#!/bin/bash

if ! [ -f backup-wp-cli-cron ]
then

  echo "Creating cron entry to start backup at: $BACKUP_TIME"
  # Note: Must use tabs with indented 'here' scripts.
  cat <<-EOF >> backup-wp-cli-cron
WORDPRESS_DB_HOST=$WORDPRESS_DB_HOST
WORDPRESS_DB_USER=$WORDPRESS_DB_USER
WORDPRESS_DB_NAME=$WORDPRESS_DB_NAME
WORDPRESS_DB_PASSWORD=$WORDPRESS_DB_PASSWORD
EOF

  echo "$BACKUP_TIME backup " >> backup-wp-cli-cron

  crontab backup-wp-cli-cron
fi

echo "Current crontab:"
crontab -l

exec "$@"
