# FROM debian:buster

# RUN apt update && apt install -y \
# 	nginx \
# 	openssl \
# 	&& rm -rf /var/lib/apt/lists/*
# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/nginx/ssl/tnakas.42.fr.key \
#     -out /etc/nginx/ssl/tnakas.42.fr.crt \
#     -subj "/CN=tnakas.42.fr"
# COPY conf/nginx.conf /etc/nginx/nginx.conf

# EXPOSE 443

# CMD ["nginx", "-g", "daemon off;"]
FROM debian:latest

RUN apt update && \
	apt upgrade -y && \
	apt install -y nginx && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]