FROM nginx:1

COPY default.patch /tmp/

RUN apt-get update
RUN apt-get -y install patch
RUN apt-get clean
RUN patch /etc/nginx/conf.d/default.conf /tmp/default.patch
RUN echo "2699f0d2b89de5231d95e719d2420573  /etc/nginx/conf.d/default.conf" | md5sum -c
RUN rm /tmp/default.patch
