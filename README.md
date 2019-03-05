# MongoDB and AWS Lambda (with Terraform)

## Run locally
If you want to test locally follow the steps below, if not skip it and go straight to *Deploy*.  

Install lambda-local:
`(sudo) npm install lambda-local -g`

Test event is `event.json`

Test if everything works (use your own password).  
`lambda-local --timeout 30 -l app.js -e event.json -E {\"MONGODB_ATLAS_CLUSTER_URI\":\"mongodb+srv://lambda:pwd@cluster/database?retryWrites=true\"}`

## Deploy
Your aws creds need to be configured for the following to work

`zip -r archive.zip node_modules/ app.js package.json`

Create a `terraform.tfvars` file that contains your password and host
```hcl-terraform
password = "yourpassword"
host = "host.mongodb.net"
```
`cd terraform`  

`terraform apply -var-file=terraform.tfvars`

Now you can test the function via the AWS UI or AWS CLI:  
`aws lambda invoke --function-name mongodb-lambda-travel-tutorial --payload file://event.json result.json`


## Result
![Atlas Result](result.png?raw=true "Result Atlas Cluster")


## References
Extended from : [Official Lambda MongoDB Tutorial](https://www.mongodb.com/blog/post/serverless-development-with-nodejs-aws-lambda-mongodb-atlas)
