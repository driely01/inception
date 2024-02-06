# Inception

## Table Of Contnets
* [DOCKER](#docker)
    * What is docker?
    * virtual machines vs containers
    * docker architecture
    * installing docker
    * development workflow
    * image
    * docker in action
* [NGINX](#nginx)
    * introduction to NGINX
    * how to install NGINX
    * introduction to NGINX’s configuration files
    * how to configure a basic web server
    * how to write your first configuration file
* [OPENSSL](#openssl)
    * what is openSSL
    * how to check if openSSL is installed in linux?
    * generate a CSR with openSSL
    * generate the private key with openSSL
    * view the private key information with openSSL
    * decode the private key with openSSL
    * extract the public key with openSSL
    * create your private key and CSR at once with openSSL
    * check the CSR info with openSSL
    * send the CSR to the CA
    * check a certification in openSSL
    * another openSSL commands
    * why we need certificate?
* [PHP-FPM](#php-fpm)
    * what is php-fpm and why use it?
    * main features of php-fpm
* [PID-ONE](#PID-ONE)
    * Unix process trees
    * Processes’ lifecycle
* [PASSPHRASE](#passphrase)
    * what is a passphrase?
    * passphrase vs password
    * passphrase example
* [RESOURCES](#resources)

---

# Docker

### What is docker?

docker is a platform for building, running and shipping applications in a consistent manner.

### virtual machines vs containers

- container
    
    an isolated environment for running an application
    
    - allow running multiple apps in isolation
    - are lightweight
    - use OS of the host
    - start quickly
    - need less hardware resources
- virtual machine
    
    an abstraction of a machine (physical hardware)
    
    **Problems**
    
    - each vm needs a full-blown OS
    - slow to start
    - resource intensive

### docker architecture

docker uses a client server architecture so it has a client component that talks to a server component using a restful api the sever also called the docker engine sits on the background and takes care of building and running docker containers

> but technically a container is just a process like other processes running on your computer.
> 

### installing docker

**for linux**

```jsx
sudo apt update
sudo apt install docker.io

sudo : start docker // start docker
sudo systemctl enable docker // enable docker
```

see the following link https://docs.docker.com/engine/install/ for more informations

### development workflow

now let’s talk about your development workflow when using docker so to start off we take an application it doesn’t matter what kind of application it is or how it’s built we take that application and dockerize  it which means we make a small changes so that it can be run by docker, how? we just add a docker file to it. a docker file is a plain text file that includes instructions that docker uses to package up this application into an image this image contains everything our application needs to run everything.

**image**

- a cut-down OS
- a runtime environment (eg node)
- application fies
- third-party libraries
- environment variables

so we create a docker file and give it to docker for packaging our application into an image, once we have an image we tell docker to start a container using that image, so a container is just a process but it’s a special kind of process because it has its own file system which is provided by the image, so our application gets loaded inside a container or a process and this is how we run our application locally on your development machine so instead of directly launching the application and running it inside a typical process we tell docker to run it inside a container an isolated environment, now here’s the beauty of docker once we have this image we can push it to a docker registry like dockerhub. dockerhub to docker is like github to git it’s a storage for docker images that anyone can use so once our application image is on dockerhub then we  can pull it on any machines running docker this machine has the same image we have on our development machine which contains a specific version of our application with everything it needs so we can start our application the same way we started it on our development machine se just tell docker to start a container using this image, so with docker we no longer need to maintain long complex release documents that have to be precisely followed all the instructions for building an image of an application are written in a we can package our application into an image and run it virtually anywhere this is the beauty of docker.

### docker in action

- create hello-docker directory and get into it
- add new file app.js
    
    ```jsx
    console.log('hello world!');
    ```
    
- add docker file  Dockerfile
    
    ```docker
    FROM node:alpine
    COPY . /app
    WORKDIR /app
    CMD node app.js
    ```
    

- run the following command to create an image
    
    ```bash
    docker build -t hello-docker .
    ```
    
- run the following command to see images
    
    ```bash
    docker image ls
    ```
    
- run the the following command to execute the image
    
    ```bash
    docker run hello-docker
    ```
    

### running ubuntu

- we go to [hub.docker.com](http://hub.docker.com) we search for **ubuntu**
- run the following command
    
    ```bash
    docker run ubuntu
    ```
    
- run the following command to start a container and interact with it
    
    ```bash
    docker run -it ubuntu
    ```
    

## docker volumes

```jsx
docker volume create name // create a volume
docker volume ls // list volumes
docker volume inspect // get details of a volume
dokcer volume rm name // remove a volume
dokcer volume prune // remove all volumes
```

running a container and attach a volume to it 

```jsx
docker run --name container_name -v volume_name:/path/of/your/image
```

# docker-compose

docker compose is a tool for defining and running multi-containers. it is the key to unlocking a streamlined and efficient development and deployment experience.

compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file. then, with a single command, you create and start all  the services from your configuration file.

compose works in all environments; production, staging, development, testing, as well as CI workflow. it also has commands for managing the whole lifecycle of your application:

- start, stop, and rebuild services
- view the status of running services
- stream the log output or running services
- run a one-off command on a service

## why use compose?

using docker compose offers several benefits that streamline the development, deployment, and management of containerized application:

- **simplified control:** docker compose allows you to define and manage multi-container application in a single YAML file. this simplifies the complex task of orchestrating and coordinating various services, making it easer to manage and replicate your application environment.
- **efficient collaboration:** docker compose configuration files are easy to share, facilitating collaboration among developers, operations teams, and other stakeholders. this collaborative approach leads to smoother workflows, faster issues resolution, and increased overall efficiency.
- **rapid application development:** compose caches the configuration used to create  a container. when you restart a service that has not changed, compose re-uses the existing containers, re-using containers means that you can make changes to your environment very quickly.
- **portability across environments:** compose supports variables in the compose file. you can use these variables to customize your composition for different  environments. or different users.
- **extensive community and support:** docker compose benefits from a vibrant and active community, which means abundant resources, tutorials, and support. this community-driven ecosystem contributes to the continuous improvement of docker compose and helps users troubleshoot issues effectively.

## common use cases of docker compose

compose can be used in many different ways. some common use cases are outlined below.

- **development environments**
- **automated testing environments**
- **single host deployments**

## how compose works

docker compose relies on a YAML configuration file, usually named compose.yaml.

the `compose.yaml` file follows the rules provided by the [Compose Specification](https://docs.docker.com/compose/compose-file/) in how to define multi-container applications. this is the docker compose implementation of the formal [Compose Specification](https://docs.docker.com/compose/compose-file/) .

You then interact with your Compose application through the [Compose CLI](https://docs.docker.com/compose/reference/). Commands such as `docker compose up` are used to start the application, while `docker compose down` stops and removes the containers.

The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory. Compose also supports `docker-compose.yaml` and `docker-compose.yml` for backwards compatibility of earlier versions. If both files exist, Compose prefers the canonical `compose.yaml`.

You can use [fragments](https://docs.docker.com/compose/compose-file/10-fragments/) and [extensions](https://docs.docker.com/compose/compose-file/11-extension/) to keep your Compose file efficient and easy to maintain.

Multiple Compose files can be [merged](https://docs.docker.com/compose/compose-file/13-merge/) together to define the application model. The combination of YAML files is implemented by appending or overriding YAML elements based on the Compose file order you set. Simple attributes and maps get overridden by the highest order Compose file, lists get merged by appending. Relative paths are resolved based on the first Compose file's parent folder, whenever complimentary files being merged are hosted in other folders. As some Compose file elements can both be expressed as single strings or complex objects, merges apply to the expanded form. For more information, see [Working with multiple Compose files](https://docs.docker.com/compose/multiple-compose-files/)

If you want to reuse other Compose files, or factor out parts of your application model into separate Compose files, you can also use `[include](https://docs.docker.com/compose/compose-file/14-include/)`. This is useful if your Compose application is dependent on another application which is managed by a different team, or needs to be shared with others.

### Illustrative example

The following example illustrates the Compose concepts outlined above. The example is non-normative.

Consider an application split into a frontend web application and a backend service.

The frontend is configured at runtime with an HTTP configuration file managed by infrastructure, providing an external domain name, and an HTTPS server certificate injected by the platform's secured secret store.

The backend stores data in a persistent volume.

Both services communicate with each other on an isolated back-tier network, while the frontend is also connected to a front-tier network and exposes port 443 for external usage.

![compose-application.webp](https://prod-files-secure.s3.us-west-2.amazonaws.com/1704bb50-ea03-4078-8832-7b94b99a6c7b/53c75739-0097-4bc5-ab1a-521f30cd80da/compose-application.webp)

The example application is composed of the following parts:

- 2 services, backed by Docker images: `webapp` and `database`
- 1 secret (HTTPS certificate), injected into the frontend
- 1 configuration (HTTP), injected into the frontend
- 1 persistent volume, attached to the backend
- 2 networks

```jsx
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier

volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

configs:
  httpd-config:
    external: true

secrets:
  server-certificate:
    external: true

networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}
```
---

# NGINX

## introduction to NGINX

NGINX is a high performance web server developed to facilitate the increasing needs of the modern web. it focuses on high performance, high concurrency, and low resource usage. although it’s mostly known as a web server, NGINX at its core is a reverse proxy server.

NGINX is not only web server on the market, though. one of the biggest competitors is Apache HTTP server (httpd), first released back on 1995. in spite of the fact that Apache HTTP server is more flexible, server admins often prefer NGINX for two main reasons:

- it can handle a higher number of concurrent requests.
- it has faster static content delivery with low resource usage.

i won’t go further into the whole Apache vs NGINX debate. but if you wish to learn more about the differences between them detail, this excellent article https://www.digitalocean.com/community/tutorials/apache-vs-nginx-practical-considerations from ***Justin Ellingwood*** may help.

in fact to explain NGINX’s request handling technique, we would like to quote two paragraphs from *Justin* article here:

> Nginx came onto the scene after Apache, with more awareness of the concurrency problems that would face sites at scale. leveraging this knowledge, Nginx was designed from the ground up to use an synchronous, non-blocking, event-driven connection handling algorithm.
> 

> Nginx spawns worker processes, each of which can handle thousands of connections. the worker processes accomplish this by implementing a fast looping mechanism that continuously checks for and processes events. decoupling actual work from connections allows each worker to concern itself with a connection only when a new event has been triggered.
> 

if that seems a bit complicated to understand, don’t worry. having a basic understanding of the inner working will suffice for now.

![wQszK2rvq-1.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/1704bb50-ea03-4078-8832-7b94b99a6c7b/e8389a37-6705-473f-8094-cb76bac445f4/wQszK2rvq-1.png)

NGINX is a faster in static content delivery while staying relatively lighter on resources because it doesn’t embed a dynamic programming language processor. when a request for a static content comes, NGINX simply responds with the file without running any additional processes.

that does’t mean that NGINX can’t handle requests that require a dynamic programming language processor. in such cases. NGINX simply delegates the tasks to separate processes such as php-fpm, node.js or python. then, once that process finishes its work, NGINX reverse proxies the response back to the client.

![_nT7rcdjG.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/1704bb50-ea03-4078-8832-7b94b99a6c7b/9b1f19e5-638d-4cce-8195-0ba6b5202a2d/_nT7rcdjG.png)

NGINX is also a lot easier to configure thanks to a configuration file syntax inspired from various scripting languages that results in compact, easily maintainable configuration files.

## how to install NGINX

installing NGINX on a linux-based system is pretty straightforward. you can either use a virtual private server running ubuntu as you playground, or you can provision a virtual machine on your local system using vagrant.

for the most part, provisioning a local virtual machine will suffice see the following article https://www.freecodecamp.org/news/the-nginx-handbook/#introduction-to-nginx

## introduction to NGINX’s configuration files

as a web server, nginx’s job is to serve static or dynamic content to the clients. but how that content are going to be served is usually controlled by configuration files.

nginx’s configuration files end with the *.conf* extension and usually live inside */etc/nginx/*  directory. let’s begin by *cd* ing into this directory and getting a list of all files:

```jsx
cd /etc/nginx

ls -lh

# drwxr-xr-x 2 root root 4.0K Apr 21  2020 conf.d
# -rw-r--r-- 1 root root 1.1K Feb  4  2019 fastcgi.conf
# -rw-r--r-- 1 root root 1007 Feb  4  2019 fastcgi_params
# -rw-r--r-- 1 root root 2.8K Feb  4  2019 koi-utf
# -rw-r--r-- 1 root root 2.2K Feb  4  2019 koi-win
# -rw-r--r-- 1 root root 3.9K Feb  4  2019 mime.types
# drwxr-xr-x 2 root root 4.0K Apr 21  2020 modules-available
# drwxr-xr-x 2 root root 4.0K Apr 17 14:42 modules-enabled
# -rw-r--r-- 1 root root 1.5K Feb  4  2019 nginx.conf
# -rw-r--r-- 1 root root  180 Feb  4  2019 proxy_params
# -rw-r--r-- 1 root root  636 Feb  4  2019 scgi_params
# drwxr-xr-x 2 root root 4.0K Apr 17 14:42 sites-available
# drwxr-xr-x 2 root root 4.0K Apr 17 14:42 sites-enabled
# drwxr-xr-x 2 root root 4.0K Apr 17 14:42 snippets
# -rw-r--r-- 1 root root  664 Feb  4  2019 uwsgi_params
# -rw-r--r-- 1 root root 3.0K Feb  4  2019 win-utf
```

among the these files, there should be one named **nginx.conf**. this is the main configuration file for nginx. you can have a look at the content of this file using *cat* program:

```jsx
cat nginx.conf

# user www-data;
# worker_processes auto;
# pid /run/nginx.pid;
# include /etc/nginx/modules-enabled/*.conf;

# events {
#     worker_connections 768;
#     # multi_accept on;
# }

# http {

#     ##
#     # Basic Settings
#     ##

#     sendfile on;
#     tcp_nopush on;
#     tcp_nodelay on;
#     keepalive_timeout 65;
#     types_hash_max_size 2048;
#     # server_tokens off;

#     # server_names_hash_bucket_size 64;
#     # server_name_in_redirect off;

#     include /etc/nginx/mime.types;
#     default_type application/octet-stream;

#     ##
#     # SSL Settings
#     ##

#     ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
#     ssl_prefer_server_ciphers on;

#     ##
#     # Logging Settings
#     ##

#     access_log /var/log/nginx/access.log;
#     error_log /var/log/nginx/error.log;

#     ##
#     # Gzip Settings
#     ##

#     gzip on;

#     # gzip_vary on;
#     # gzip_proxied any;
#     # gzip_comp_level 6;
#     # gzip_buffers 16 8k;
#     # gzip_http_version 1.1;
#     # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

#     ##
#     # Virtual Host Configs
#     ##

#     include /etc/nginx/conf.d/*.conf;
#     include /etc/nginx/sites-enabled/*;
# }

# #mail {
# #    # See sample authentication script at:
# #    # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
# # 
# #    # auth_http localhost/auth.php;
# #    # pop3_capabilities "TOP" "USER";
# #    # imap_capabilities "IMAP4rev1" "UIDPLUS";
# # 
# #    server {
# #        listen     localhost:110;
# #        protocol   pop3;
# #        proxy      on;
# #    }
# # 
# #    server {
# #        listen     localhost:143;
# #        protocol   imap;
# #        proxy      on;
# #    }
# #}
```

whoa! that’s a lot of stuff. trying to understand this file at its current state sill be a nightmare. so let’s rename the file and create a new empty one:

```jsx
# renames the file
sudo mv nginx.conf nginx.conf.backup

# creates a new file
sudo touch nginx.conf
```

i highly discourage you from editing the original *nginx.conf*  file unless you absolutely know what you’re doing. for learning purposes, you may rename it, butr later on, we will show you how you should go about configuring a server in a real life scenario.

## how to configure a basic web server

in this section, you’ll finally get your hands dirty by configuring a basic static web server from the ground up. the goal of this section is to introduce you to the syntax and fundamental concepts of nginx configuration files.

## how to write your first configuration file

```jsx
events {

}

http {

    server {

        listen 80;
        server_name nginx-handbook.test;

        return 200 "Bonjour, mon ami!\n";
    }

}
```

if you have experience building REST APIs then you may guess from the return 200 “bonjour, mon ami!\n”; line that the server has been configured to respond with a status code of 200 and the message “bonjour, mon ami!”.

---

# openSSL

proper SSL implementation is crucial to website’s security and success. and, with so many web owner learning about SSL for the first time, it’s essential to equip them with all the necessary tools and utilities. one such tool is openSSL, so what is openSSL, and why is it so important?

### what is openSSL

openSSL is all about its command lines, all you have to do is learn a few common openSSL commands and, with each new certificate, the configuration process will become quick and easier.

first released in 1998, openSSL is available for linux, windows macOS and BSD systems. most of the linux distributions come with openSSL pre-compiled.

### how to check if openSSL is installed in linux?

to check if openSSL is installed on your linux system, use the commands bellow.

```jsx
rpm -qa | grep openssl // for rpm packages
dpkg -l | grep openssl // for deb packages
pacman -Q openssl // for arch linux
```

### generate a CSR with openSSL

you can use openSSL to create your CSR (certificate signing request) code. run the following command to generate the CSR.

```jsx
openssl req -new -key yourdomain.key -out yourdomain.csr
```

you can also submit your information within the command line with help of the -subj switch.

this command will disable the question prompts

```jsx
openssl req -new -key yourdomain.key -out youdomain.crs -subj
"/C=US/ST=CA/L=San Francisco/O=Your Company, Inc./OU=IT/CN=youdomain.com"
```

### generate the private key with openSSL

to generate your private key, you need to specify the key algorithm, the key size, and an optional passphrase. the standard key algorithm is RSA, bur you can also select ECDSA for specific situations. when choosing a key algorithm, make sure won’t run into compatibility issues. in this article we only show you how to generate a private key via the RSA algorithm.

for your key size, you should pick 2048 bits when using the RSA key algorithm, and 256 bits when  using the ECDSA algorithm. any key size lower than 2048 in not secure, while a higher value may slow down the performance.

finally, you should decide whether you need a passphrase for your private key or not, please note that certain servers will not accept private keys with passphrase.

once you’re ready to generate your private kay (with RSA algorithm), run the commands bellow

```jsx
openssl genrsa -out yourdomain.key 2048
```

this command will create the yourdomain.key file in your current directory. your private key will be in the PEM (privacy enhanced mail) format.

### view the private key information with openSSL

you can view the encoded contents of your private key via the following command

```jsx
cat yourdomain.key
```

### decode the private key with openSSL

to decode your private key, run the following command below

```jsx
openssl rsa -text -in yourdomain.key -noout
```

### extract the public key with openSSL

to extract your public key from the private key, use the following command

```jsx
openssl rsa -in yourdomain.key -pubout yourdomain_public.key
```

### create your private key and CSR at once with openSSL

openSSL is so versatile, there’s also a command to generate both private key and CSR

```jsx
openssl req -new
-newkey rsa:2048 -nodes -keyout yourdoman.key
i>-out yourdomain.csr
-sub "/C=US/ST=CA/L=San Francisco/O=Your Company, Inc./OU=IT/CN=yourdomain.com"
```

this command generate the private key without a passphrase (-keyout yourdomain.key) and the CSR code (out your_domain.csr)

### check the CSR info with openSSL

to ensure you’ve provided the correct information before submitting the CSR to your CA, run the command below

```jsx
openssl req -text -in yourdomain.csr -noout -verify
```

### send the CSR to the CA

run the following command to view and copy the entire contents of the CSR

```jsx
cat yourdomain.csr
```

make sure you include *begin certificate request* and *end certificate request tags, and paste every thing into your SSL vendor’s order form.*

### check a certification in openSSL

after your CA delivers the SSL certificate to your inbox, run the command below to ensure that the certificate’s info matches your private key.

```jsx
openssl -x509 -text -in yourdomain.crt -noout
```

this concludes our list of common openSSL commands.

### another openSSL commands

the following command how to generate a private kay

```jsx
sudo openssl genrsa -aes128 -out file_name_pri.pem 2048
```

the following command how to generate a public kay

```jsx
sudo openssl rsa -in file_name_pri.pem -pubout > file_name_pub.pem
```

the following command is how to encrypt a file using public key

```jsx
sudo openssl pkeyutl -encrypt -inkey file_name_pub.pem -pubin -in file_to_encrypt -out encrypted_file.txt
```

the following command is how to decrypt a file using private key

```jsx
sudo openssl pkeyutl -decrypt -inkey private_key_file.pem -in encrypted_file.txt > decrypted_file.txt
```

## why we need certificate?

certificates play a crucial role in ensuring the security and trustworthiness of communication over the internet. here are some reasons why certificates are needed

1. **Authentication:** certificates are used for authenticating the identity of parties involved in a communication. in web browsing, for example, when you connect to a secure website (using https), the website presents a certificate to prove its identity. this helps users ensure they are connecting to the intended and legitimate website.
2. **Encryption:** certificates are essential for setting up encrypted communication channels. SSL/TLS certificates, for instance, are used to encrypt data in transit between a user’s browser and a web server, this encryption helps protect sensitive information (such as login credentials, credit cards numbers) from being intercepted and read by unauthorized entities.
3. **data integrity:** certificates also play a role in ensuring the integrity of transmitted data. by using digital signatures and cryptographic hashing algorithms, certificates help verify that the data has not been tampered with during transit.
4. **trust and confidence:** certificates are issued by certificate authorities (CAs) or trusted entities. when a website or service presents a certificate signed by a trusted CA, it enhance trust and confidence in the communication. users can be more certain that they are interacting with a legitimate and secure entity.
5. **securing communication between devices:** certificates are used beyond web communication. the are employed in various network protocols, email systems (s/mime), virtual private networks (vpns), and other technologies to secure communication between devices.
6. **compliance and regulations:** in certain industries and applications, compliance with security standards and regulations is mandatory. certificates are often a key component of meeting these compliance requirements. for example, in the healthcare industry, the health insurance portability and accountability act (hipaa) mandates the use of encryption and secure communication, often requiring the use of certificates.
7. **code signing:** certificates are used to sign software and code, providing assurance to users that the code has been not tampered with and is from a trusted source.

in summary, certificates are fundamental component of the security infrastructure on the internet, providing a mechanism for authentication, encryption, and a date integrity. they help establish trust confidence in online interactions and are essential for maintaining the privacy and security of sensitive information

---

# php-fpm

## what is php-fpm and why use it?

php-fpm (fastCGI process manager) is an alternative php fastCGI implementation with some additional features useful for sites of any size, especially busier sites. it’s an efficient method to process dynamic content on your website, providing a significant speed boost

it maintains pools (workers ready to serve php code) to accomplish this. these persistent php processes can serve queries instantly without any delay in initializing the php process. this speeds up your php environment and, eventually, your web applications.

## main features of php-fpm

let’s look at the features that make php-fpm a powerful tool for managing high-traffic websites.

- manages tasks by initiating and concluding them independently
- adapts to various work settings, including ports, logging patterns, and file uploads
- uses existing configuration files to complete requests and flush data
- managing data from databases and high-traffic websites
- enhance security measures and prevents server overloading
- offers high configurability with different uid/gid/chroot/environment and php.ini settings
- provides several options for performance tuning

---

# PID-ONE

## Unix process trees

Whenever a command is issued in a Unix environment, whether in the foreground like when you run `ls` in your terminal, or in the background, a **process** handles that command. Those processes run the program, but also hold a lot of metadata for the system to manage.

For example, each process has a **PID,** a number that is its unique identifier. A process also has a **PPID**, which is the ID of its **parent process**.

**Unix processes** are ordered in a tree. Each process can have child processes, and all have a parent process. All except the very first process, the **PID 1**.

![tree_unix_processes.webp](https://prod-files-secure.s3.us-west-2.amazonaws.com/1704bb50-ea03-4078-8832-7b94b99a6c7b/0aad6607-cdf0-4d76-89c2-acd12b0ccf5d/tree_unix_processes.webp)

**PID 1**, also known as **init**, is the common ancestor of all processes and is the foundation on which all of them run. Thus, you can imagine its importance.

## Processes’s lifecycle

The parent process has many responsibilities relating to the lifecycle. If a process terminates, some of its data is kept until the parent collects it. If the parent does not collect it, it becomes a **zombie process**. If the parent terminates, its child processes become **orphaned** and have to be adopted by another process: they are often adopted by **init**.

---

## PASSPHRASE

### what is a passphrase?

a passphrase refers to a password that is created using a string of words rather than random characters like a password. while passphrase may be easier to remember than complex passwords, it’s important to consider the risks of using passphrase.

### passphrase vs password

unlike passwords, passphrases are not as complex because they use common dictionary words that are strung together to create a password. passwords on the other hand should be created using password best practices, which may people don’t do. one password best practice is to ensure you are not including dictionary words when creating them. the best way to create a strong password is by using a random password generator fo that the password is unique and cannot be easily to cracked by a cybercriminal.

### passphrase example

passphrase use a phrase that usually means something to the one who created it. for example, someone loves ice cream they might make a phrase based on that such as “i love ice cream” as you can tell, using this as password for one of you account can be risky since it uses common dictionary words.

another example of a passphrase would by using random words altogether like “soup shelter summer indeed rod 9” which also uses common dictionary words. if this were used as a password, it places the account at risk of becoming compromised using a dictionary attack.

---

# RESOURCES
* [Docker my Miro Template](https://miro.com/miroverse/docker/?social=copy-link)
* [Docker](https://www.docker.com/)
* [Docker Deep Dive (pdf)](https://m.vk.com/wall-54530371_376392?lang=en)
* [NGINX Handbook](https://www.freecodecamp.org/news/the-nginx-handbook/#how-to-configure-ssl-and-http-2)
* [WordPress (pdf)](https://staff.emu.edu.tr/mobinabeheshti/Documents/courses/WP-1-cms.pdf)
* [OpenSSL](https://www.ssldragon.com/blog/what-is-openssl/)
* [Using OpenSSL to send Asynchronous Encrypted messages (video)](https://www.youtube.com/watch?v=Q764OumalJo&ab_channel=Dr.K)
* [STL](https://www.cloudflare.com/learning/ssl/transport-layer-security-tls/)
* [PID-ONE](https://www.padok.fr/en/blog/docker-processes-container#:~:text=Unix%20processes%20are%20ordered%20in,which%20all%20of%20them%20run.)
* [PHP-FPM](https://www.cloudways.com/blog/php-fpm-on-cloud/#:~:text=A%3A%20PHP%2DFPM%20FastCGI,to%20handle%20tremendous%20loads%20simultaneously.)
* [PHP-FPM (manual)](https://www.php.net/manual/en/install.fpm.php)
* [CGI](https://en.wikipedia.org/wiki/Common_Gateway_Interface)
* [HTTP](https://www.cloudflare.com/learning/ddos/glossary/hypertext-transfer-protocol-http/)
* [HTTP (MDN)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
* [HTTP (video)](https://www.youtube.com/watch?v=iYM2zFP3Zn0&ab_channel=TraversyMedia)
* [RSA-4096 Ransomware](https://www.comparitech.com/net-admin/rsa-4096-ransomware/#:~:text=RSA%2D4096%20is%20a%20legitimate,well%20as%20honest%20business%20people.)
* [RSA algorithm (video)](https://www.youtube.com/watch?v=4zahvcJ9glg&ab_channel=EddieWoo)
