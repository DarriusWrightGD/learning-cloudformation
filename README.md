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