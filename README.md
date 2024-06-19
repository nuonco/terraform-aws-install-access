# IAM-Role Module

This modules provisions an IAM role for sandbox, granting access to create Nuon installs.

Please read more in our [docs](https://docs.nuon.co/guides/install-access-permissions).

## Usage

You can use the following module invocation in any Terraform project:

```hcl
module "iam-role" {
  source = "nuonco/install-access/aws"
  version = "1.0.0"

  sandbox = "aws-ecs"
  prefix = "iam-role-prefix"
}
```

## Support Access

By adding support access, we will grant trust to two additional Nuon owned principals that will allow us to more easily
assist in debugging.

This is usually only needed to help during setup.
