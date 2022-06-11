#!/bin/sh

echo "Pre-Build Steps:"
echo "authenticating with AWS ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 064935689278.dkr.ecr.us-east-1.amazonaws.com

echo "Build Steps:"
echo "building image..."
docker build -t react-app .
docker tag react-app:latest 064935689278.dkr.ecr.us-east-1.amazonaws.com/react-app:latest
echo "Post-Build Steps:"
echo "pushing image to AWS ECR..."
docker push 064935689278.dkr.ecr.us-east-1.amazonaws.com/react-app:latest

echo "Done!"