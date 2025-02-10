FROM debian:buster
RUN apt update && apt install -y mariadb-server
COPY ./my.cnf /etc/mysql/my.cnf
EXPOSE 3306
CMD ["mysqld"]