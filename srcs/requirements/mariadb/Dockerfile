FROM debian:stable

RUN apt-get update \
    && apt-get install mariadb-server -y

COPY tools/script.sh /

RUN chmod +x script.sh

EXPOSE 3306

CMD ["./script.sh"]