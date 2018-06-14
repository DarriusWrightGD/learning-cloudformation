``` bash
# from root directory
aws cloudformation create-stack --stack-name s3-website-stack --template-body file://02-s3/website.yml
aws s3 cp .\02-s3\index.html s3://wright-website-bucket-1 --acl public-read
```

``` bash
# clean up stack
aws s3 rm --recursive s3://wright-website-bucket-1
aws cloudformation create-stack --stack-name s3-website-stack --template-body file://02-s3/website.yml
```