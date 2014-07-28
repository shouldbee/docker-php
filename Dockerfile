FROM phusion/baseimage

RUN apt-get update -qq && apt-get install -y php5 php5-mysql php5-curl apache2 libapache2-mod-php5

ADD php/general.ini  /etc/php5/mods-available/general.ini
ADD php/mbstring.ini /etc/php5/mods-available/mbstring.ini
RUN php5enmod general mbstring

ADD apache/apache.conf /etc/apache2/sites-available/sites.conf
RUN a2enmod rewrite && a2ensite sites && a2dissite 000-default
ADD apache/security.conf /etc/apache2/conf-available/security.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
