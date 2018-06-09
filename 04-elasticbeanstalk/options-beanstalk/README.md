``` bash
# Run the following commands to set up the S3 app bucket
STACK_ID=$(aws cloudformation create-stack --stack-name nginx-options-bucket --template-body file://app-bucket.yml --query 'StackId' --output text)
aws cloudformation wait stack-create-complete --stack-name ${STACK_ID}
BUCKETNAME=$(aws cloudformation describe-stacks --stack-name ${STACK_ID} --query "Stacks[?StackId=='${STACK_ID}'] | [0].Outputs[?OutputKey=='BucketName'] | [0].OutputValue" --output text | tr -d '[:space:]')
aws s3 cp ./Dockerrun.aws.json s3://${BUCKETNAME}
```

``` bash
# Create parameters.json file with the parameters listed in template.yml
aws cloudformation create-stack --stack-name nginx-eb-options --template-body file://template.yml --parameters file://parameters.json
```

Example parameters.json file

```json
[
    { 
     "ParameterKey":"AppBucket",
     "ParameterValue": "nginx-options-bucket-nginxappbucket-xxxxxxxx"
    },
    {
     "ParameterKey": "SubnetIds",
     "ParameterValue": "subnet-xxxx978, subnet-xxxx4d5"
    },
    {
        "ParameterKey": "VPCId",
        "ParameterValue": "vpc-xxxxxbca"
    }
]
```