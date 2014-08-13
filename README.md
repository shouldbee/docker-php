# docker-php

This container includes:

* PHP 5.5
* Apache

## How to run

```console
$ docker run -dit --net host \
  -v /document_root:/document_root \
  -v /var/log/php:/var/log/php \
  -v /var/log/apache2:/var/log/apache2 \
  -e DOCUMENT_ROOT=/document_root shouldbee/php
```

## Show logs

```console
$ tail -f /var/log/php/error.log /var/log/apache2/*
```