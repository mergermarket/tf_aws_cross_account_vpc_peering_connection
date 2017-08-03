variable "aws_region" {
  description = "The AWS region."
}

variables "role_name" {
  description = "The name of the IAM role to assume."
}

variable "session_name" {
  description = "The session name for assuming roles."
}

variable "name" {
  description = "Name/name prefix for resource created by this module."
}

variable "account_id" {
  description = "AWS account id to create the peering connection in."
}

variable "peer_account_id" {
  description = "AWS account id for the other end of the peering connection."
}

variable "vpc_id" {
  description = "ID of the local vpc to peer."
}

variable "peer_vpc_id" {
  description = "ID of the remote vpc to peer."
}

variable "peering_connection_id" {
  description = "The connection id obtained when the connection was initiated."
}

variable "peer_cidr" {
  description = "The CIDR range for the peer VPC."
}
