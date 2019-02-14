#Docker file for Apache2 HTTP server
#The code is driven from the original Docker Hhub repository for Apache2 with some changes to the apache version, useres, and requirements
# Github Link: https://github.com/docker-library/httpd/blob/f6cb814440756f97821895731765d306528a3429/2.4/Dockerfile
# Dockerhub Link: https://hub.docker.com/_/httpd


FROM debian:stretch-slim

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added

#RUN groupadd -r kurdistan && useradd -r --create-home -g kurdistan rasoul

ENV HTTPD_PREFIX /usr/local/apache2
ENV PATH $HTTPD_PREFIX/bin:$PATH

RUN mkdir -p "$HTTPD_PREFIX" \
	&& chown raosul:kurdistan "$HTTPD_PREFIX"
  
WORKDIR $HTTPD_PREFIX

# install httpd runtime dependencies
# https://httpd.apache.org/docs/2.4/install.html#requirements


