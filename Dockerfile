FROM phusion/baseimage

RUN apt-get update -qq && apt-get install -y php5 php5-mysql php5-curl apache2 libapache2-mod-php5

ADD php.ini /etc/php5/conf.d/00-general.ini
ADD php-mbstring.ini /etc/php5/conf.d/00-mbstring.ini

ADD apache.conf /etc/apache2/sites-available/sites.conf
RUN a2enmod rewrite
RUN a2ensite sites
RUN a2dissite 000-default

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
