# pull image of debian from the repository (dockerhub)
FROM debian:stable

# update package manager and install mariadb-server
RUN apt-get update \
    && apt-get install mariadb-server -y

# copy the script into root directory of our container
COPY tools/script.sh /

# add execute permission to the script
RUN chmod +x script.sh

# expose port 3306 to the container
EXPOSE 3306

# execute the script when the container start running
CMD ["./script.sh"]