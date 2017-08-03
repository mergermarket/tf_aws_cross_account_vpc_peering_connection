# AWS Cross Account Peering

This module sets up a VPC peering connection between VPCs in two AWS accounts.
It handles assuming roles in both of the accounts (an IAM role - default "admin"
- must be accessible in each account).

## Example

```
module "peering-connection-accountx-accounty" {
  name            = "accountx-accounty"

  from_account_id = "0123456789"
  from_vpc_id     = "vpc-01234567"

  to_account_id   = "987654321"
  to_vpc_id       = "vpc-01234567"
}
```

## Parameters

* `name` (string, required) - the name/name prefix to give resources created by the module.
* `from_account_id` (string, required) - the account to establish the peering connection from.
* `from_vpc_id` (string, required) - the vpc in the _from_ account.
* `from_role_name` (string, default=`"admin"`) - the role to assume in the _from_ account.
* `to_account_id` (string, required) - the account to accept the peering connection in.
* `to_vpc_id` (string, required) - the vpc in the _to_ account.
* `to_role_name` (string, default=`"admin"`) - the role to assume in the _to_ account.

## Outputs


