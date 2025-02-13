FROM debian:buster

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/init.sql /docker-entrypoint-initdb.d/
RUN chown -R mysql:mysql /var/lib/mysql
EXPOSE 3306

CMD ["mysqld"]