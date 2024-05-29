#!/bin/sh

#The script expects two parameters, the first one is the GitHub repository and the second one the DockerHub repository
GITN=$1
DOCN=$2

#We clone the GitHub repository
git clone "https://github.com/$GITN.git"

#We move to the local repository that git gloned for us
REPN=${GITN##*/}
cd $REPN

#The script expects the GitHub repository to have a Dockerfile at the root
#We build it and name it the DockeHub repository name
docker build . -t $DOCN

#We login to Docker
docker login

#...and push the image to DockerHub
docker push $DOCN

#I tested this script with the repository and Dockerfile from exercise 3.1 and it seemed to work well!"
