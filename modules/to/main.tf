provider "aws" {
  region = "${var.vpc_region}"

  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id}:role/${var.role_name}"
    session_name = "test"
  }
}

