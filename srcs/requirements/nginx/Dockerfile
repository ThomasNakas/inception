FROM debian:bullseye

RUN apt update && \
	apt upgrade -y &&\
	apt install -y \
	nginx openssl curl

COPY tools/certs.sh /tools/certs.sh
RUN chmod +x /tools/certs.sh && /tools/certs.sh
COPY ./conf/def.conf /etc/nginx/sites-available/.
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/def.conf /etc/nginx/sites-enabled/default
COPY ./tools/certs/cert.pem /etc/nginx/cert.pem
COPY ./tools/certs/key.pem /etc/nginx/key.pem
COPY ./tools/index.html /var/www/html/
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]