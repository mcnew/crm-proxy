FROM nginx:1

COPY default.patch /tmp/

RUN apt-get update
RUN apt-get -y install patch
RUN apt-get clean
RUN patch /etc/nginx/conf.d/default.conf /tmp/default.patch
RUN echo "5375cb7ce07787cc40f98739b40e9fc6  /etc/nginx/conf.d/default.conf" | md5sum -c
RUN rm /tmp/default.patch
