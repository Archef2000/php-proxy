#!/bin/bash
if [ "${PROXY_HTTPS}" == "TRUE" ]; then
  sed -i "s\'https://' : 'http://'\'https://' : 'https://'\g" /var/www/vendor/athlon1600/php-proxy/src/helpers.php
else
  sed -i "s\'https://' : 'https://'\'https://' : 'http://'\g" /var/www/vendor/athlon1600/php-proxy/src/helpers.php
fi
service apache2 start
tail -f /dev/null
