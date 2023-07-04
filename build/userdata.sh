#! /bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker run --name mlops-practice -p 3000:3000 -d giabaohb48/mlops-practice:latest