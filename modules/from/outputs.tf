data "aws_vpc" "current" {
  id = "${var.vpc_id}"
}

output "cidr" {
  value = "${data.aws_vpc.current.cidr_block}"
}

output "peering_connection_id" {
  value = "${aws_vpc_peering_connection.connection.id}"
}
