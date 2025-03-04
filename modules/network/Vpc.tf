resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name  = "${var.vpc_name}"
    Owner = local.owner
    cost_center = local.cost_center
    TeamDL = local.team_dl
    environment = "${var.environment}"

  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.IGW_name}"
  }
}