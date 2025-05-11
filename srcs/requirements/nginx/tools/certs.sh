#!/bin/sh
if [ ! -d "certs" ]; then
	mkdir certs
	openssl req -x509 -newkey rsa:2048 -nodes -keyout certs/key.pem -out certs/cert.pem -days 365 \
	-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=SelfSigned Org/OU=IT/CN=login.42.fr/emailAddress=tnakas.ua@gmail.com"
fi