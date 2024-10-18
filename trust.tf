locals {
  default_principals = [
    // nuon prod data plane account
    "arn:aws:iam::814326426574:root",
  ]
  // NOTE: the following trust policies are setup to help the Nuon team do 
  // support on any installs.
  support_principals = [
    // nuon stage data plane account
    "arn:aws:iam::766121324316:root",
  ]

  nuon_principals    = var.enable_support_access ? concat(local.default_principals, local.support_principals) : local.default_principals
  trusted_principals = var.delegation_role_arn != "" ? [var.delegation_role_arn] : local.nuon_principals
}

data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole", ]

    principals {
      type        = "AWS"
      identifiers = local.trusted_principals
    }
  }
}
