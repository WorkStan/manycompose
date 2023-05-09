FROM php:8.2.5-fpm-alpine3.17

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

RUN apk --update add wget \
  git \
  curl \
  libpq-dev \
  libxml2-dev \
  zip \
  unzip \
  linux-headers

RUN set -xe && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS

RUN rm /var/cache/apk/*

RUN addgroup -g 1000 app && adduser -u 1000 -G app -s /bin/sh -D app

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

WORKDIR app

USER app
