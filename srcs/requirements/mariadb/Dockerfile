FROM debian:11

RUN apt-get update \
    && apt-get install mariadb-server mariadb-client -y

COPY tools/*.sh /

EXPOSE 9000

CMD ["./script.sh"]