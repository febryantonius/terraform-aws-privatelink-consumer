locals {
  cluster_name      = "vpce"
  vpce_cluster_name = "${var.service_name}-${local.cluster_name}"
  nlb_port          = 80
  vpce_subnet_ids   = "${matchkeys(data.aws_subnet.available_subnets.*.id, data.aws_subnet.available_subnets.*.availability_zone, data.aws_vpc_endpoint_service.service_provider.availability_zones)}"
}
