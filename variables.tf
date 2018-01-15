variable "name" {
  description = "The name/name prefix to give resources created by the module."
}

variable "from_account_id" {
  description = "The account to establish the peering connection from."
}

variable "from_vpc_id" {
  description = "The vpc in the _from_ account."
}

variable "from_region" {
  description = "The region where the frpm vpc is."
  default     = "eu-west-1"
}

variable "to_account_id" {
  description = "The account to accept the peering connection in."
}

variable "to_vpc_id" {
  description = "The vpc in the _to_ account."
}

variable "to_role_name" {
  description = "The role to assume in the _to_ account."
  default     = "admin"
}

variable "from_role_name" {
  description = "The role to assume in the _from_ account."
  default     = "admin"
}

variable "to_region" {
  description = "The region where the to vpc is."
  default     = "eu-west-1"
}
