module "vpce_sg_name" {
  source = "github.com/traveloka/terraform-aws-resource-naming?ref=v0.13.0"

  name_prefix   = "${local.vpce_cluster_name}"
  resource_type = "security_group"
}

resource "aws_security_group" "vpce_sg" {
  name        = "${module.vpce_sg_name.name}"
  description = "Security group for ${local.vpce_cluster_name}"

  vpc_id = "${var.vpc_id}"

  tags {
    Name          = "${module.vpce_sg_name.name}"
    ProductDomain = "${var.product_domain}"
    Environment   = "${var.environment}"
    Description   = "Security group for ${local.vpce_cluster_name}"
    ManagedBy     = "terraform"
  }
}

resource "aws_security_group_rule" "allow_egress_from_vpce_to_all_at_80" {
  type        = "egress"
  from_port   = "${local.nlb_port}"
  to_port     = "${local.nlb_port}"
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.vpce_sg.id}"
}

resource "aws_vpc_endpoint" "service_consumer" {
  vpc_id             = "${var.vpc_id}"
  subnet_ids         = ["${local.vpce_subnet_ids}"]
  security_group_ids = ["${aws_security_group.vpce_sg.id}", "${var.security_group_ids}"]
  service_name       = "${var.service_provider_name}"
  vpc_endpoint_type  = "Interface"
}
