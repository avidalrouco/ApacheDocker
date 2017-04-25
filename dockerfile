FROM debian
MAINTAINER avidal@std.es
RUN apt-get update && \
    apt-get -y install apache2 && \
    apt-get -y install wordpress curl php5

EXPOSE 80

ADD ./startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

ADD ./wordpress.conf /etc/apache2/sites-available

CMD ["/bin/bash", "/opt/startup.sh"]
