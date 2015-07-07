# DOCKER-VERSION 1.7.0
FROM ubuntu-upstart
MAINTAINER dbenge


ADD https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb /dispatcher/pagespeed/
RUN apt-get -y install apache2
WORKDIR /dispatcher/pagespeed
RUN dpkg -i mod-pagespeed-*.deb
RUN apt-get -y -f install

#Copies required assets
#ADD resources/cq-publish-4503.jar /aem/cq-publish-4503.jar
#ADD resources/license.properties /aem/license.properties

EXPOSE 8080