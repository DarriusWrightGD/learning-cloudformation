http://cidr.xyz/

``` powershell
# Stand up the network layer
aws cloudformation create-stack --stack-name vpc --template-body file://template.yml
#Stand up the infrastructure
aws cloudformation create-stack --stack-name alb --template-body file://alb.yml
```