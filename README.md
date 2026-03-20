# merapar-challenge
------------------
## description
AWS infrastructure that serves an html page with a dynamic string that can change without having to redeploy.
## how to deploy
#### prerequisites
- install terraform.
- have AWS credentials as environment variables on your PC.
#### deployment
1. `terraform init` to initialize the project and modules.
2. `terraform apply` to apply changes in AWS.
#### things of note
you can change the dynamic string in the parameter store.
