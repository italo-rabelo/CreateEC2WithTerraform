terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner = "italo-rabelo"
      menaged-by = "terraform"
    }
  }
}



