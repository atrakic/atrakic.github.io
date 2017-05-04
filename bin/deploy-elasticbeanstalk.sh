#!/bin/bash

# deploy to AWS elastic Beanstalk
SHA1=$1
APPLICATION=$2 
ENV_NAME=$3

# Deploy image to Docker Hub
docker push $2:$SHA1

# Create new Elastic Beanstalk version
EB_BUCKET=$APPLICATION-bucket

DOCKERRUN_FILE=$SHA1-Dockerrun.aws.json

sed "s/<TAG>/$SHA1/" < Dockerrun.aws.json.template > $DOCKERRUN_FILE

aws s3 cp $DOCKERRUN_FILE s3://$EB_BUCKET/$DOCKERRUN_FILE

aws elasticbeanstalk create-application-version --application-name $APPLICATION \
  --version-label $SHA1 --source-bundle S3Bucket=$EB_BUCKET,S3Key=$DOCKERRUN_FILE

# Update Elastic Beanstalk environment to new version
aws elasticbeanstalk update-environment --environment-name $ENV_NAME \
    --version-label $SHA1
