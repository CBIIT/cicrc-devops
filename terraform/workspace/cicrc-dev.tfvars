# global
public_subnet_ids = []
private_subnet_ids = [
  "subnet-4f35f112",
  "subnet-409a0424"
]

vpc_id = "vpc-29a12251"
project = "cicrc"

region = "us-east-1"
create_rds_backup_bucket=true

#alb
certificate_domain_name = "*.cancer.gov"
domain_name = "cancer.gov"

#ecr
create_ecr_repos = true
ecr_repo_names = ["web"]

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
  "subnet-319d0355",
  "subnet-df30f482"
]