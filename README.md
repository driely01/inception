# Inception

## Table Of Contnets
* [DOCKER](#docker)

## DOCKER
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

see the link below for more informations

docs.docker.com/get-docker/

### development workflow

now let’s talk about your development workflow when using docker so to start off we take an application it doesn’t matter what kind of application it is or how it’s built we take that application and dockerize  it which means we make a small changes so that it can be run by docker, how? we just add a docker file to it. a docker file is a plain text file that includes instructions that docker uses to package up this application into an image this image contains everything our application needs to run everything.

**********image**********

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