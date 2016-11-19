#!/bin/sh
mkdir -p /var/www/baikal/Specific/db \
  && chown -R nobody:nobody /var/www/baikal/Specific \
  && supervisord --nodaemon

