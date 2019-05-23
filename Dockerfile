#
# Installs WordPress with wp-cli (wp.cli.org) installed
# Docker Hub: https://registry.hub.docker.com/u/conetix/wordpress-with-wp-cli/
# Github Repo: https://github.com/latinxco/docker-wordpress-wp-cli

FROM wordpress:latest

# Add sudo in order to run wp-cli as the www-data user
RUN apt-get update && apt-get install -y sudo less mysql-client cron vim

# Add WP-CLI
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN chmod 644 /etc/crontab

ENV BACKUP_TIME 0 3 * * *
ENV WORDPRESS_DB_HOST host
ENV WORDPRESS_DB_USER user
ENV WORDPRESS_DB_NAME wordpress
ENV WORDPRESS_DB_PASSWORD password

COPY docker-entrypoint.sh /bin/entrypoint.sh
COPY backup.sh /bin/

RUN chmod +x /bin/backup.sh
RUN chmod +x /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]

CMD ["cron", "-f"]
