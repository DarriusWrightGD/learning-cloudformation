```bash
# Create
aws cloudformation create-stack --stack-name dynamodb-example --template-body file://03-dynamodb/dynamodb.yml --capabilities CAPABILITY_IAM --parameters ParameterKey=VpcId,ParameterValue=vpc-b3536bca ParameterKey=SubnetId,ParameterValue=subnet-01168978 ParameterKey=KeyName,ParameterValue=us-west-2

# Once created ssh into the ec2 that was created from the stack and you can run the following commands
aws dynamodb describe-table --table-name WrightDynamoDb
aws dynamodb list-tables

# If you run the following command it will fail because the ec2's role does not have enough permissions
aws dynamodb list-global-tables
```


```bash
# Destroy
aws cloudformation delete-stack --stack-name dynamodb-example
```