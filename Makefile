IMAGE := shouldbee/php

build:
	sudo docker build -t $(IMAGE) .

test:
	sudo docker run --rm $(IMAGE) php -v | grep 'PHP 5.5.9'
	sudo docker run --rm $(IMAGE) php -m | grep mbstring
	sudo docker run --rm $(IMAGE) php -m | grep mysql
	sudo docker run --rm $(IMAGE) php -m | grep curl
	sudo docker run --rm -v /vagrant:/vagrant $(IMAGE) php /vagrant/php/test.php
	sudo docker run --rm $(IMAGE) test -d /var/log/php

	sudo docker rm -f http || true
	sudo docker run -d -i -t --name http -v /vagrant:/vagrant --net host $(IMAGE)
	wget --retry-connrefused --content-on-error localhost/test.php -qO -
	curl -s -I localhost | grep -P '^Server: Apache\r$$'
	sudo docker rm -f http

push: test
	sudo docker push $(IMAGE)
