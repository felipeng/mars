FROM alpine:3.5
MAINTAINER felipeng84@gmail.com
RUN apk add --no-cache python2
RUN mkdir -p /www
ADD https://github.com/felipeng/mars/archive/master.tar.gz /www
RUN mv /www/mars-master /www/mars
EXPOSE 8080
ENTRYPOINT ["/usr/bin/python","/www/mars/app/mars.py"]
