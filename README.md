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
* [PASSPHRASE](#passphrase)
    * what is a passphrase?
    * passphrase vs password
    * passphrase example

## Note
We not giving you the solution of the project we just sharing the information and the concept of each element we descover below

## DOCKER
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

sudo systemctl start docker // start docker
sudo systemctl enable docker // enable docker
```

see the following link https://docs.docker.com/engine/install/ for more informations

### development workflow

now let’s talk about your development workflow when using docker so to start off we take an application it doesn’t matter what kind of application it is or how it’s built we take that application and dockerize  it which means we make a small changes so that it can be run by docker, how? we just add a docker file to it. a docker file is a plain text file that includes instructions that docker uses to package up this application into an image this image contains everything our application needs to run everything.

### image

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

- we go to [hub.docker.com](http://hub.docker.com) we search for ************ubuntu************
- run the following command
    
    ```bash
    docker run ubuntu
    ```
    
- run the following command to start a container and interact with it

## openSSL

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

this command generate the private key without a passphrase (-keyout yourdomain.key) and the CSR code (out yourdomain.csr)

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

## PASSPHRASE

### what is a passphrase?

a passphrase refers to a password that is created using a string of words rather than random characters like a password. while passphrase may be easier to remember than complex passwords, it’s important to consider the risks of using passphrase.

### passphrase vs password

ulike passwords, passphrases are not as complex because they use common dictionary words that are strung together to create a password. passwords on the other hand should be created using password best practices, which may people don’t do. one password best practice is to ensure you are not including dictionary words when creating them. the best way to create a strong password is by using a random password generator fo that the password is unique and cannot be easily to cracked by a cybercriminal.

### passphrase example

passphrase use a phrase that usually means something to the one who created it. for example, someone loves ice cream they might make a phrase based on that such as “i love ice cream” as you can tell, using this as password for one of you account can be risky since it uses common dictionary words.

another example of a passphrase would by using random words altogether like “soup shelter summer indeed rod 9” which also uses common dictionary words. if this were used as a password, it places the account at risk of becoming compromised using a dictionary attack.