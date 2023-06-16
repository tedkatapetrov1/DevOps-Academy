# # Create an IAM policy allowing SNS to use the KMS key
# resource "aws_iam_policy" "my_sns_iam_policy" {
#   name        = "example-policy"
#   description = "Example IAM policy for SNS KMS encryption"

#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "EnableKMSKeyForSNS",
#         "Effect" : "Allow",
#         "Action" : [
#           "kms:Encrypt*",
#           "kms:Decrypt*",
#           "kms:ReEncrypt*",
#           "kms:GenerateDataKey*",
#           "kms:DescribeKey"
#         ],
#         "Resource" : [
#           aws_kms_key.example_key.arn
#         ]
#       }
#     ]
#   })
# }

# # Attach the IAM policy to the SNS topic
# resource "aws_sns_topic_policy" "my_sns_topic_policy" {
#   arn    = aws_sns_topic.my_sns_topic.arn
#   policy = aws_iam_policy.my_sns_iam_policy.policy
# }
