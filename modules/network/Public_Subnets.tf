resource "aws_instance" "public-server" {
  # count = length(var.public_cird_block)
  count             = length(var.public_cird_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_cird_block, count.index+1)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name        = "${var.vpc_name}-Public-Server-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }

}