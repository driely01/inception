#use the offecial debian base image
FROM debian:11

# update the package list and install nginx and openssl
RUN apt-get update \
	&& apt-get install -y nginx \
	&& apt-get install -y openssl

# create ssl directory for storing private key and certificate
RUN mkdir /etc/nginx/ssl

# create a CSR and private key using openssl and store them in /etc/nginxi
RUN  openssl req -newkey rsa:4096 \
	-nodes -days 365 -sha256 -x509 \
	-out /etc/nginx/ssl/del-yaag.crt \
	-keyout /etc/nginx/ssl/del-yaag.key \
	-subj "/C=MA/ST=Khouribga/L=khouribga/O=1337 School/OU=del-yaag/CN=del-yaag/"

# copy our script to the root of our continer
COPY tools/script.sh /

# copy our nginx config file into nginx
COPY conf/*.conf /etc/nginx/sites-enabled/

# copy error templates to /usr/share/nginx/html/ inside our container
COPY tools/errors/custom_404.html /usr/share/nginx/html/
COPY tools/errors/custom_403.html /usr/share/nginx/html/
COPY tools/errors/custom_50x.html /usr/share/nginx/html/

# add execution permission to the script
RUN chmod +x script.sh

# expose port 443 for nginx
EXPOSE 443

# when the container start running the entrypoint is to run the script
ENTRYPOINT ["/script.sh"]

# start nginx in the foreground
# daemon off; this is the global configuration directive being set.
# it explicitly turns off the daemon mode.
# in daemon mode, a process runs in the background and
# forks itself into the background after starting.
CMD ["nginx", "-g", "daemon off;"]
