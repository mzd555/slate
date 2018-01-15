#!/usr/bin/env bash
if [ "$1" == "sandbox" ]
then
    vagrant ssh -c "cd /vagrant && bundle exec middleman build --clean"
    aws s3 sync ./build/ s3://docs.deliverysolutions.co
    aws cloudfront create-invalidation --distribution-id EBVQ883DRQWKB --paths /index.html
else
    vagrant ssh -c "cd /vagrant && bundle exec middleman build --clean"
    aws s3 sync ./build/ s3://development.docs.deliverysolutions.co
fi
