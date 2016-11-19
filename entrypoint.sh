#!/bin/sh
chown -R nobody:nobody /var/www/baikal/Specific && supervisord --nodaemon
