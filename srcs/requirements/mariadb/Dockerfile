FROM debian:bullseye

RUN apt update && apt install -y \
    mariadb-server \ 
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY tools/init.sh /etc/mysql/init.sh
RUN chmod +x /etc/mysql/init.sh


EXPOSE 3306
RUN	mariadb-install-db
CMD ["./etc/mysql/init.sh"]