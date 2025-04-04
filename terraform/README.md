# Terraform on AWS
Open AWS CloudShell - in higher environment only one of CloudOne teams can do this.
If terraform is not installed or the version is different than we expect, then install required teraform version

# cicrc-devops terraform commands

wget https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_linux_amd64.zip

unzip terraform_1.10.5_linux_amd64.zip

mkdir ~/bin

mv terraform ~/bin

git clone https://github.com/CBIIT/cicrc-devops.git

cd cicrc-devops

git checkout higher-env

cd terraform

terraform init -reconfigure -backend-config=workspace/cicrc-prod.tfbackend

terraform workspace list

**make sure stage and prod are listed**

terraform workspace select stage

**This will run all terraform scripts**

terraform plan -var-file=workspace/cicrc-stage.tfvars

**This will run one terraform module**

terraform plan -target=module.alb -var-file=workspace/cicrc-stage.tfvars

**If no error and plan looks OK and will add, delete and modify as expected then apply**

terraform apply -target=module.alb -var-file=workspace/cicrc-stage.tfvars