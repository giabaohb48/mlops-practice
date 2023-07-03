#! /bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker pull 749971312816.dkr.ecr.us-west-1.amazonaws.com/mlops-practice:latest
sudo docker run --name mlops-practice -p 3000:3000 -d mlops-practice:latest