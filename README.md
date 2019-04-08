terraform-aws-privatelink-consumer
==================================

A Terraform module which creates an AWS VPC Endpoint for service consumer PrivateLink.

Usage
-----

```hcl
module "service-consumer-privatelink" {
  source                = "github.com/traveloka/terraform-aws-privatelink-consumer?ref=master"
  vpc_id                = "vpc-abcd0123"
  service_name          = "abcxyz"
  product_domain        = "abc"
  environment           = "development"
  available_subnet_ids  = ["subnet-0a1b2c34", "subnet-0a1b2d45"]
  service_provider_name = "com.amazonaws.vpce.ap-southeast-1.vpce-svc-01abc2de3fa4b5cd6"
}
```

Subnet IDs Selection
--------------------

Subnets used by interface endpoint must be on the same Availability Zone with the endpoint service. You just need to provide list of available subnets at most one subnet for each Availability Zone. This module will filter provided `available_subnet_ids` which are in the same Availability Zone with the endpoint service and use them.

Authors
-------

- [Febry Antonius](https://github.com/febryantonius)

License
-------

Apache 2 Licensed. See LICENSE for full details.
