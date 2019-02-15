#Docker file for Apache2 HTTP server
#The code is driven from the original Docker Hhub repository for Apache2 with some changes to the apache version, useres, and requirements
# Github Link: https://github.com/docker-library/httpd/blob/f6cb814440756f97821895731765d306528a3429/2.4/Dockerfile
# Dockerhub Link: https://hub.docker.com/_/httpd


FROM debian:stretch-slim


RUN	apt-get update; \
	apt-get install -y --no-install-recommends wget; \
	wget http://archive.apache.org/dist/httpd/httpd-2.4.23.tar.gz; \
	gzip -d httpd-2.4.23.tar.gz ;\
	tar vxf httpd-2.4.23.tar ;\
	wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.41.tar.gz; \
	gzip -d pcre-8.41.tar.gz ; \
	tar xvf pcre-8.41.tar ; \
	apt-get install -y --no-install-recommends \
			gcc \ 
			g++ \
			make \
			libapr1-dev \
			libaprutil1-dev \
	; \
	cd .. ; \
	cd pcre-8.41 ; \ 
	./configure --prefix=/usr/local/pcre ; \
	make ; \
	make install ; \
	cd ../httpd-2.4.23 ; \
	./configure --with-pcre=/usr/local/pcre ; \
	make ; \
	make install ; \
	cd /usr/local/apache2 ; \
	bin/apachectl -k start
	
	COPY apachectl /usr/local/bin/
EXPOSE 80


CMD ["/usr/local/bin/apache2/bin/apachectl -k start"]
	
	
	
