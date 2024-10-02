# global
public_subnet_ids = []
private_subnet_ids = [
  "subnet-819c02e5",
  "subnet-8832f6d5"
]

vpc_id = "vpc-dca724a4"
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
    image_url = "php:8.1.12-apache-bullseye"
    cpu = 256
    memory = 512
    path = ["/*"]
    number_container_replicas = 1
  }
}

#rds
db_subnet_ids = [
  "subnet-1a34f047",
  "subnet-db9f01bf"
]