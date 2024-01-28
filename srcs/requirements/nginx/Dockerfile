#use the offecial debian base image
FROM debian:11

# update the package list and install nginx
RUN apt-get update \
	&& apt-get install -y nginx \
	&& apt-get install -y openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# create ssl directory for storing private key and certificate
RUN mkdir /etc/nginx/ssl

# create a CSR and private key using openssl
# and store them in /etc/nginxi
RUN  openssl req -newkey rsa:4096 \
	-nodes -days 365 -sha256 -x509 \
	-out /etc/nginx/ssl/del-yaag.crt \
	-keyout /etc/nginx/ssl/del-yaag.key \
	-subj "/C=MA/ST=Khouribga/L=khouribga/O=1337 School/OU=del-yaag/CN=del-yaag/"

# copy all files in the root in the root of image
# COPY . /var/www/html

# remove the original nginx config file 
#RUN rm /etc/nginx/nginx.conf

# copy our nginx config file into nginx
COPY *.conf /etc/nginx/sites-enabled/
COPY tools/errors/custom_404.html /usr/share/nginx/html/
COPY tools/errors/custom_403.html /usr/share/nginx/html/
COPY tools/errors/custom_50x.html /usr/share/nginx/html/

# expose port 80 for nginx
EXPOSE 443

# start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
