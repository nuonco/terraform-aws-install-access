locals {
  trusted_principals = var.delegation_role_arn ? [var.delegation_role_arn] : [
    // nuon prod install provisioner account
    "arn:aws:iam::007754799877:root",
    // nuon prod data plane account
    "arn:aws:iam::814326426574:root",

    // NOTE: the following trust policies are setup to help the Nuon team do support on any installs.
    "arn:aws:iam::676549690856:root",
    "arn:aws:iam::766121324316:root",
  ]
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
