#! /bin/bash

# replace the openssl certificate, private key and server name values with environment variables taht located at .env file
sed -i 's/ssl_del-yaag_certificates_here/'${CERTS_T}'/g' /etc/nginx/sites-enabled/nginx.conf
sed -i 's/ssl_del-yaag_private_key_here/'${CERTS_KEY}'/g' /etc/nginx/sites-enabled/nginx.conf
sed -i 's/server_del-yaag_name_here/'${DOMAIN_NAME}'/g' /etc/nginx/sites-enabled/nginx.conf

# replace the current shell process with a new one, typically a command or script.
exec "$@"