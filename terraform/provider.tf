terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.1"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      EnvironmentTier = terraform.workspace
      DevLead         = "Saman Moshafi"
      CreatedBy       = "sowmya karavadi"
      ResourceName    = "NCI-CRCR-${terraform.workspace}"
      FISMA           = "moderate"
      ManagedBy       = "terraform"
      OpsModel        = "cbiit managed hybrid"
      Program         = "nci-doe"
      PII             = "yes"
      Backup          = local.level
      Project         = "crcr"
      ApplicationName = "CRCR"
      ProjectManager  = "Saman Moshafi"
    }
  }
}