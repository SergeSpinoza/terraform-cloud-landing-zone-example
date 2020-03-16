# Terraform Cloud Landing Zone example with CI on GitLab

## Repository description
This repository contains example of terraform landing zone sample. 

In root on folder `landing_zone` exists terraform files for creation GCP bucket for terraform state file. You need to create on this folder file `landing-zone-service-account.json` with GCP service account. Run once `terraform init` and  `terraform apply` on this folder for create bucket. 

Folder `prod` contains terraform files for create landing zone, and folder `modules` contains terraform modules for create landing zone. 

You need to create file `terraform.tfvars` based on  `terraform.tfvars.example` in all folders where exists file `terraform.tfvars.example`

File `.gitlab-ci.yml` in root directory describes CI pipeline for GitLab-CI. 



## Run pipeline on GitLab-ci: 
- Create GCP service account with rights on `Organization`: 
  - Billing Account Administrator
  - Owner
  - Folder Admin
  - Organization Administrator
  - Project Creator
- Enable in Project (where will be located landing zone) APIs:
  - Cloud Resource Manager API
  - Identity and Access Management (IAM) API
  - Cloud Billing API
- Set variable in Gitlab with name `GCP_SERVICEACCOUNT` - it's must be GCP service account json file. 


## Manual testing
For manual testing you need to export env variables: 
- export GOOGLE_BACKEND_CREDENTIALS=./landing-zone-service-account.json
- export GOOGLE_CREDENTIALS=./landing-zone-service-account.json

Then you cat use standard terraform commands: `terraform apply` and etc...

