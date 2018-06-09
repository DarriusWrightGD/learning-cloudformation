STACK_ID=$(aws cloudformation create-stack --stack-name nginx-bucket --template-body file://app-bucket.yml --query 'StackId' --output text)
echo "Creating the S3 Bucket to store the versions of the elasticbeanstalk ... (${STACK_ID})"
aws cloudformation wait stack-create-complete --stack-name ${STACK_ID}
echo "Bucket created"
BUCKETNAME=$(aws cloudformation describe-stacks --stack-name ${STACK_ID} --query "Stacks[?StackId=='${STACK_ID}'] | [0].Outputs[?OutputKey=='BucketName'] | [0].OutputValue" --output text | tr -d '[:space:]')
aws s3 cp ./Dockerrun.aws.json s3://${BUCKETNAME}
aws cloudformation create-stack --stack-name nginx-eb --template-body file://template.yml --parameters ParameterKey=AppBucket,ParameterValue=${BUCKETNAME}