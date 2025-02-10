FROM debian:uster
RUN apt update && apt instal -y mariadb-server
COPY ./my.cnf /etc/mysql/my.cnf
EXPOSE 3306
CMD ["mysqld"]