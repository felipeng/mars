FROM alpine:3.5
MAINTAINER felipeng84@gmail.com
RUN apk add --no-cache python2
RUN mkdir -p /www
COPY app /www/mars
EXPOSE 8080
ENTRYPOINT ["/usr/bin/python","/www/mars/mars.py"]
