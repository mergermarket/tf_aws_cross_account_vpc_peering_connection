data "aws_region" "current" {
  current = true
}

data "aws_caller_identity" "current" {}

module "from" {
  source = "./modules/from"

  aws_region   = "${data.aws_region.current.name}"
  role_name    = "${var.from_role_name}"
  session_name = "${data.aws_caller_identity.current.user_id}"

  name = "${var.name}"

  account_id = "${var.from_account_id}"
  vpc_id     = "${var.from_vpc_id}"

  peer_account_id = "${var.to_account_id}"
  peer_vpc_id     = "${var.to_vpc_id}"

  peer_cidr = "${module.to.cidr}"
}

module "to" {
  source = "./modules/to"

  aws_region   = "${data.aws_region.current.name}"
  role_name    = "${var.to_role_name}"
  session_name = "${data.aws_caller_identity.current.user_id}"

  name = "${var.name}"

  account_id = "${var.to_account_id}"
  vpc_id     = "${var.to_vpc_id}"

  peer_account_id = "${var.from_account_id}"
  peer_vpc_id     = "${var.from_vpc_id}"

  peering_connection_id = "${module.from.peering_connection_id}"

  peer_cidr = "${module.from.cidr}"
}
