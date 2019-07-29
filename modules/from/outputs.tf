data "aws_vpc" "current" {
  id = "${var.vpc_id}"
}

output "cidr" {
  value = "foo"
}

output "peering_connection_id" {
  value = "bah"
}
