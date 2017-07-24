FROM alpine:3.5
MAINTAINER felipeng84@gmail.com
COPY . /mars
RUN apk add --no-cache python2 py2-pip
RUN pip install -r /mars/requirements.txt
EXPOSE 8080
ENTRYPOINT ["/usr/bin/python","/mars/app/mars.py"]
