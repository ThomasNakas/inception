#!/bin/sh
if [ ! -d "certs" ]; then
	mkdir /etc/nginx
	openssl req -x509 -newkey rsa:2048 -nodes -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem -days 365 \
	-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=SelfSigned /OU=IT/CN=tnakas.42.de/emailAddress=tnakas.ua@gmail.com"
fi