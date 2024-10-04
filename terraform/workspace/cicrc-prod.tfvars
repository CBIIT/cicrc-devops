# global
public_subnet_ids = [
  "subnet-9d9907f9",
  "subnet-a033f7fd"
]
private_subnet_ids = [
  "subnet-8de37de9",
  "subnet-4c35f111"
]

vpc_id = "vpc-0bab2873"
project = "cicrc"

region = "us-east-1"
create_rds_backup_bucket=true

#alb
certificate_domain_name = "*.cancer.gov"
domain_name = "cancer.gov"

#ecr
create_ecr_repos = false
ecr_repo_names = [""]

#ecs
application_subdomain = "computational"
microservices  = {
  web = {
    name = "web"
    port = 80
    health_check_path = "/"
    priority_rule_number = 10
    image_url = "php:8.1.29-apache-bullseye"
    cpu = 256
    memory = 512
    path = ["/*"]
    number_container_replicas = 1
  }
}

#rds
db_subnet_ids = [
  "subnet-893ffbd4",
  "subnet-b9e27cdd"
]