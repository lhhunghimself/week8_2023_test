#!/usr/local/bin/python3
import boto3

# Create a session
session = boto3.Session()

# Now you can use this session to create service clients or resources
s3 = session.resource('s3')

# And you can use this s3 resource to interact with your S3 buckets
for bucket in s3.buckets.all():
    print(bucket.name)
