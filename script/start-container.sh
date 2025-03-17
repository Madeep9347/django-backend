#!/bin/bash
echo "stop the existing container"
docker rm -f my-app

echo "login to ecr"
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 491085426369.dkr.ecr.ap-south-1.amazonaws.com
echo "pull the image"
docker pull 491085426369.dkr.ecr.ap-south-1.amazonaws.com/django-backend:latest
#start container
echo "start the container"
docker run -d -p 8000:80 --name my-app 491085426369.dkr.ecr.ap-south-1.amazonaws.com/django-backend:latest
