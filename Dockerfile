FROM nginx:1

COPY default.patch /tmp/

RUN apt-get update
RUN apt-get -y install patch
RUN apt-get clean
RUN patch /etc/nginx/conf.d/default.conf /tmp/default.patch
RUN echo "e1afa4a7bfcbe4cd1bf03f43bee904aa  /etc/nginx/conf.d/default.conf" | md5sum -c
RUN rm /tmp/default.patch
