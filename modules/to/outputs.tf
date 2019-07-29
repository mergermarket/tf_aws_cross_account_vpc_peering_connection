data "aws_vpc" "current" {
  id = "${var.vpc_id}"
}

output "cidr" {
  value = "blah"
}
