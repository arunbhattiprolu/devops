#this is a sample image
FROM Ubuntu:latest
Maintainer bhattiproluarunkumar@gmail.com
RUN apt-get update
RUN apt-get install –y nginx
CMD [“echo”,”Image created”] 
