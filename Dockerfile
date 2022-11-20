FROM debian:stable-slim AS builder
RUN apt-get update && apt-get install cron wget curl ca-certificates bash -y --no-install-recommends
RUN wget -O install.sh https://raw.githubusercontent.com/Athlon1600/php-proxy-installer/master/install.sh \
    && sed -i '$d' install.sh \
    && bash install.sh

FROM debian:stable-slim
# apk add apache2 php-apache2 php php-curl vnstat bc php-mbstring youtube-dl
RUN apt-get -qq update && apt-get -y install bc vnstat apache2 php libapache2-mod-php php-curl php-mbstring youtube-dl -y --no-install-recommends \
    && rm -rf /var/www/* \
    && rm -rf /etc/apache2/sites-available/* \
    && rm -rf /etc/apache2/sites-enabled/* \
    && apt-get clean

COPY --from=builder /etc/apache2/ /etc/apache2/
COPY --from=builder /var/www/ /var/www/
COPY run.sh /run.sh
ENTRYPOINT ["/bin/bash"]
CMD ["/run.sh"]
