FROM alpine:3.4
MAINTAINER Johannes Schramm <js@jss.de>

ENV VERSION 0.4.6
ENV CHECKSUM 946e8e4161f7ef84be42430b6e9d3bb7dd4bbbe241b409be208c14447d7aa7a6

ENV PKG baikal-$VERSION.zip
ENV URL https://github.com/fruux/Baikal/releases/download/$VERSION/$PKG

RUN apk --no-cache add \
      nginx \
      php5-ctype \
      php5-dom \
      php5-fpm \
      php5-json \
      php5-openssl \
      php5-pdo_sqlite \
      php5-xml \
      php5-xmlreader \
      s6
RUN apk --no-cache add \
      openssl \
      unzip
RUN sed -ie "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/php.ini
RUN wget $URL
RUN echo $CHECKSUM "" $PKG | sha256sum -c -
RUN unzip $PKG -d /var/www
RUN rm $PKG
RUN mkdir /var/www/baikal/html/.well-known
RUN apk --force --purge --rdepends del \
      openssl \
      unzip

ADD /entrypoint.sh /entrypoint.sh
ADD /etc /etc

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80

VOLUME /var/www/baikal/Specific
