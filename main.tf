

data "aws_caller_identity" "current" {}

module "from" {
  source = "./modules/from"

  role_name    = "${var.from_role_name}"
  session_name = "${substr(replace(data.aws_caller_identity.current.user_id, "/[^A-Za-z0-9+=,.@-]+/", "_"), 64)}"

  name = "${var.name}"

  account_id = "${var.from_account_id}"
  vpc_id     = "${var.from_vpc_id}"
  vpc_region = "${var.from_region}"

  peer_account_id = "${var.to_account_id}"
  peer_vpc_id     = "${var.to_vpc_id}"
  peer_region     = "${var.to_region}"

  peer_cidr = "${module.to.cidr}"
}

module "to" {
  source = "./modules/to"

  role_name    = "${var.to_role_name}"
  session_name = "${substr(replace(data.aws_caller_identity.current.user_id, "/[^A-Za-z0-9+=,.@-]+/", "_"), 64)}"

  name = "${var.name}"

  account_id = "${var.to_account_id}"
  vpc_id     = "${var.to_vpc_id}"
  vpc_region = "${var.to_region}"

  peer_account_id = "${var.from_account_id}"
  peer_vpc_id     = "${var.from_vpc_id}"

  peering_connection_id = "${module.from.peering_connection_id}"

  peer_cidr = "${module.from.cidr}"
}
