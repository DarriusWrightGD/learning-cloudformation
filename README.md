# CloudFormation

Is a declarative way of outlining your AWS Infrastrcuture, for any resources (most are supported).

Cloudformation creates those for you in the right order with the exact configuration.

## Benefits

- Infrastructure as code
    - No manually created code
    - The code can be versioned
    - Changes to the infrastructure are reviewed as code

- Cost
    - Each resources within the stack is tagged so you can see how much it costs you.
    - You can automate deletion of the templates
- Productivity
    - Ability to destroy and recreate infrastructure on the fly
    - Automated generation of diagram for your templates

- Separation of concerns
    - VPC stacks
    - Network stacks
    - App stacks

- Don't re-invent the wheel
    - Leverage existing templates on the web
    - Leverage Documentation


https://github.com/awslabs/ecs-refarch-continuous-deployment

## Goal

Create a CI/CD Pipeline that can live with the repository and report stats i.e. unit tests, coverage, etc over time.


CodePipeline
CodeDeploy
CodeBuild
Lambda - setup the lambda initially
ApiGateway - setup the api gateway initially

## Developer Notes

### Cloudformation Stack Creation

```bash
# Creating a stack
aws cloudformation create-stack --stack-name ec2-stack --template-body file://01-ec2/sample.yml --parameters ParameterKey=VpcId,ParameterValue=vpc-b3536bca ParameterKey=SubnetId,ParameterValue=subnet-01168978 --tags Key=Name,Value=darrius-ec2-stack
```

```bash
# Deleting a stack
aws cloudformation delete-stack --stack-name ec2-stack
```

```bash
# List all existing stacks
aws cloudformation list-stacks --query 'StackSummaries[?StackStatus!=`DELETE_COMPLETE` && StackStatus!=`DELETE_IN_PROGRESS`]'