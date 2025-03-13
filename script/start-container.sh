#!/bin/bash
echo "stop the existing container"
docker rm -f my-app

echo "login to ecr"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183894437.dkr.ecr.us-east-1.amazonaws.com
echo "pull the image"
docker pull 590183894437.dkr.ecr.us-east-1.amazonaws.com/django-backend:latest

echo "start the container"
docker run -d -p 8000:80 --name my-app 590183894437.dkr.ecr.us-east-1.amazonaws.com/django-backend:latest
