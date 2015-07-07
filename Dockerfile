# DOCKER-VERSION 1.7.0
FROM dbenge/aem-6-1-base
MAINTAINER dbenge

RUN apt-get -y install openssl
RUN apt-get -y install apache2

# Install pagespeed
ADD https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb /aem/dispatcher/pagespeed/module/
WORKDIR /aem/dispatcher/pagespeed/module
RUN dpkg -i mod-pagespeed-*.deb
RUN apt-get -y -f install

# Install dispatcher mod - Linux x86 64bit OpenSSL 1.0
ADD https://www.adobeaemcloud.com/content/companies/public/adobe/dispatcher/dispatcher/_jcr_content/top/download_10/file.res/dispatcher-apache2.4-linux-x86-64-ssl10-4.1.9.tar.gz /aem/dispatcher/module/
WORKDIR /aem/dispatcher/module/
RUN tar -zxvf *.gz
WORKDIR /aem/dispatcher/
RUN mkdir logs
COPY resources/dispatcher.any dispatcher.any

#Copies required assets
#ADD resources/cq-publish-4503.jar /aem/cq-publish-4503.jar
#ADD resources/license.properties /aem/license.properties

#CMD ["-D", "FOREGROUND"]
#ENTRYPOINT ["/usr/sbin/httpd"]

EXPOSE 80 443