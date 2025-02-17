FROM debian:buster

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/init.sql /docker-entrypoint-initdb.d/
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
EXPOSE 3306

CMD ["mysqld"]