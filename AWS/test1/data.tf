data "aws_iam_policy_document" "permissions_rights" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:Describe*",
      "s3:List*"
    ]
    resources = [
      "*"
    ]
  }
}
data "aws_iam_policy_document" "assumed" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "AWS"
      identifiers = ["arn:aws:sts::411194033911:assumed-role/AWSReservedSSO_AWSAdministratorAccessLockedTags_3ca3a2188eddfcf8/teodor_petrov@flutterint.com"]
    }
  }
}