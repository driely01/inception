FROM debian:11

RUN apt-get update \
	&& apt-get install -y nginx

COPY tools /
COPY tools/script.sh /

RUN chmod +x script.sh

# expose port 443 for nginx
EXPOSE 5000

ENTRYPOINT ["/script.sh"]

# start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
