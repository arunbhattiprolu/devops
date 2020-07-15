#this is a sample image
FROM ubuntu:latest
Maintainer bhattiproluarunkumar@gmail.com
RUN apt-get update
#RUN apt-get install –y nginx
CMD [“echo”,”Image updated”] 
#chmod 777 /var/run/docker.sock
