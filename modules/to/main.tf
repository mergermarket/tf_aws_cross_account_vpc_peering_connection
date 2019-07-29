provider "aws" {
  region = "${var.vpc_region}"

  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id}:role/${var.role_name}"
    session_name = "test"
  }
}

resource "aws_vpc_peering_connection_accepter" "connection" {
  vpc_peering_connection_id = "${var.peering_connection_id}"
  auto_accept               = true

  tags {
    Name = "${var.name}"
  }
}

data "aws_subnet_ids" "current" {
  vpc_id = "${var.vpc_id}"
}

data "aws_route_table" "current" {
  count     = "${length(data.aws_subnet_ids.current.ids)}"
  vpc_id    = "${var.vpc_id}"
  subnet_id = "${element(sort(data.aws_subnet_ids.current.ids), count.index)}"
}

resource "aws_route" "route" {
  count                     = "${length(distinct(data.aws_route_table.current.*.id))}"
  route_table_id            = "${element(sort(distinct(data.aws_route_table.current.*.id)), count.index)}"
  destination_cidr_block    = "${var.peer_cidr}"
  vpc_peering_connection_id = "${var.peering_connection_id}"
}
