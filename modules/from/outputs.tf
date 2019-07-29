data "aws_vpc" "current" {
  id = "${var.vpc_id}"
}

output "cidr" {
  value = "hello"
}

output "peering_connection_id" {
  value = "me"
}
