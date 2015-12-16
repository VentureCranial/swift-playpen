FROM venturecranial:swift-runtime

# Install nginx webserver

RUN apt-get update && \
    apt-get install -y --force-yes \
       nginx \
       curl \
       fcgiwrap && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

COPY fibonacci.swift /usr/share/nginx/html/fib.cgi
RUN chmod a+x /usr/share/nginx/html/fib.cgi

COPY default.nginx /etc/nginx/sites-available/default

ADD start.sh /root/start.sh
RUN chmod a+x /root/start.sh

VOLUME ["/usr/share/nginx/html"]

CMD ["/root/start.sh"]



