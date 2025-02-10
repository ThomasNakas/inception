FROM alpine:3.14
RUN apk update && apk add nginx openssl
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./ssl /etc/nginx/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "deamon off;"]