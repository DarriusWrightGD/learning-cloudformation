from troposphere import (
    Ref,
    Template,
    ec2,
    Join,
    Output,
    Parameter,
)

template = Template()
template.add_description("My First cloudformation template with troposphere")

template.add_resource(
    ec2.Instance(
        "sampleInstance",
        ImageId="ami-e251209a",
        InstanceType="t2.micro"
    )
)

result = template.to_yaml()

print(result)