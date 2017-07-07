FROM alpine:3.5
MAINTAINER felipeng84@gmail.com
RUN apk add --no-cache python2
ADD https://github.com/felipeng/mars/archive/master.zip /www
ENTRYPOINT ["/usr/bin/python /www/app/mars.py"]
