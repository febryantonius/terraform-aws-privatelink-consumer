provider "aws" {
  region = "ap-southeast-1"
}

#############################################################################################
# Local values declaration. Change the value with a valid value before you used this example
#############################################################################################
locals {
  vpc_id                = "vpc-abcd0123"
  service_name          = "abcxyz"
  product_domain        = "abc"
  environment           = "development"
  available_subnet_ids  = ["subnet-0a1b2c34", "subnet-0a1b2d45"]
  service_provider_name = "com.amazonaws.vpce.ap-southeast-1.vpce-svc-01abc2de3fa4b5cd6"
}

#########################
# Interface VPC Endpoint
#########################
module "service-consumer" {
  source = "../../"

  vpc_id                = "${local.vpc_id}"
  service_name          = "${local.service_name}"
  product_domain        = "${local.product_domain}"
  environment           = "${local.environment}"
  available_subnet_ids  = ["${local.available_subnet_ids}"]
  service_provider_name = "${local.service_provider_name}"
}
