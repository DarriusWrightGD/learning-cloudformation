1. Upload template.yml file to and s3 bucket
2. Get the s3 bucket url i.e. s3://.../template.yml and assign it to the TemplateUrl Parameter
3. Run the following command `aws cloudformation deploy --stack-name auto-stack --template ./auto-scaling.yml`