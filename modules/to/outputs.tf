data "aws_vpc" "current" {
  id = "${var.vpc_id}"
}

output "cidr" {
  value = "${data.aws_vpc.current.cidr_block}"
}
