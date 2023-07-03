#! /bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker pull $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$IMAGE_TAG
sudo docker run --name mlops-practice -p 3000:3000 -d $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$IMAGE_TAG