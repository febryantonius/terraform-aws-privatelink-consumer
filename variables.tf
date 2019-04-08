variable "vpc_id" {
  type        = "string"
  description = "ID of the VPC in which the endpoint will be used"
}

variable "service_name" {
  type        = "string"
  description = "Name of the service which want to be connect with"
}

variable "product_domain" {
  type        = "string"
  description = "Abbreviation of the product domain the created resources belong to"
}

variable "environment" {
  type        = "string"
  description = "The environment of the created resources resided on"
}

variable "available_subnet_ids" {
  type        = "list"
  description = "IDs of the available subnets in which to create the endpoint network interfaces"
}

variable "security_group_ids" {
  type        = "list"
  description = "IDs of the security groups to associate with the VPC Endpoint"
  default     = []
}

variable "service_provider_name" {
  type        = "string"
  description = "Service name of the PrivateLink service provider"
}
