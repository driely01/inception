FROM debian:stable

RUN apt-get update \
    && apt-get install mariadb-server -y

COPY tools/*.sh /

EXPOSE 3306

CMD ["./script.sh"]