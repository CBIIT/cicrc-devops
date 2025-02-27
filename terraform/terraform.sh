#!/bin/bash 
wget https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_linux_amd64.zip
unzip terraform_1.10.5_linux_amd64.zip
mkdir ~/bin
mv terraform ~/bin
git clone https://github.com/CBIIT/cicrc-devops.git
cd cicrc-devops
git checkout main
cd terraform
terraform init -reconfigure -backend-config=workspace/cicrc-prod.tfbackend
terraform workspace list
terraform workspace select stage
terraform plan -var-file=workspace/cicrc-stage.tfvars