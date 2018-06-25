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

## Developer Notes

**Important**: all examples are in us-west-2

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
```

## The Well Architected Framework

The five pillars

- Security
- Reliability
- Performance Efficiency
- Cost Optimization
- Operational Excellence

General Design Principles

- Stop guessing your capacity needs
  - eliminate guessing what you need, this will make you spend to much or little on resources
- Test systems at production scale
  - create a testing environment and destroy it
- Automate to make architectural experimentation easier
  - Use cloudformation for replication of your resources and allow of quick experimental checks
- Allow for evolutionary architectures
  - Automation allows you to innovate through dynamic architectures. This means that we can evolve our aws architecture as the business needs occur.
- Data-Driven architectures
  - Log things into cloudwatch to use data how to tell us what we need to do to improve our architecture
- Improve through games days: simulates heavy load testing like black friday sales

### Security

- Apply security at all layers
  - Subnets
  - ACLs
  - elb ports
  - linux instances
  - windows instances
- Enable traceability
  - if someone hacks the environment we should know how they did it
- Automate response to security events
  - Someone continualy trying to ssh into and instance from a non whitelisted ip.
- Focus on securing your system
  - Harden the operating system
- Automate security best practices
  - Apply the operating system hardening to an ami for launching

#### Shared Responsibility Model

You are responsible for security in the cloud

- Network Traffic protection
- Server-side encryption
- Client-side Data Encryption & Data Integrity Authentication
- Operating system, network, and firewall configuration
- Platform, Applications, Identity and Access Management
- Customer Data

Amazon is responsible for security of the cloud

- Compute, storage, database, networking
- Regions, AZs, Edge Locations

#### 4 Main areas

- Data protection
  - Segment between public and private to members of org
  - Implement least privilege across roles
  - Encrypt everything where possible rest/transit
- Privilege Management
- Infrastructure Protection
- Detective controls

### Reliability

### Performance Efficiency

### Cost Optimization

### Operational Excellence
