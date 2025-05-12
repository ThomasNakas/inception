FROM debian:bullseye

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

CMD ["/init.sh"]

# FROM debian:bullseye

# RUN apt update && apt install -y \
#     mariadb-server \
#     mariadb-client \
#     && rm -rf /var/lib/apt/lists/*

# COPY conf/my.cnf /etc/mysql/mariadb.conf.d/
# COPY tools/init.sql /docker-entrypoint-initdb.d/init.sql

# RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
# RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

# EXPOSE 3306
# CMD ["mysqld"]