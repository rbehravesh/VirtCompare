
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
	
EXPOSE 80

	
	
	
