#!/bin/bash
if [ "${PROXY_HTTPS}" -eq "TRUE" ]; then
  sed -i "s\'https://' : 'http://'\'https://' : 'http://'\g" /var/www/vendor/athlon1600/php-proxy/src/helpers.php
fi
service apache2 start
tail -f /dev/null
