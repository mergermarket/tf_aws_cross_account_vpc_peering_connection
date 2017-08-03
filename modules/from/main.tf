provider "aws" {
  region = "${var.aws_region}"

  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id}:role/${var.role_name}"
    session_name = "test"
  }
}

resource "aws_vpc_peering_connection" "connection" {
  vpc_id        = "${var.vpc_id}"
  peer_owner_id = "${var.peer_account_id}"
  peer_vpc_id   = "${var.peer_vpc_id}"
  auto_accept   = false

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
  route_table_id            = "${element(distinct(data.aws_route_table.current.*.id), count.index)}"
  destination_cidr_block    = "${var.peer_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.connection.id}"
}
