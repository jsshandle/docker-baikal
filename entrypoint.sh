#!/bin/sh
mkdir -p /var/www/baikal/Specific/db \
  && chown -R nobody:nobody /var/www/baikal/Specific \
  && exec s6-svscan /etc/s6/

