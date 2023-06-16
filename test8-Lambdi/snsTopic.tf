# Configure the SNS topic
resource "aws_sns_topic" "my_sns_topic" {
  name = "my-sns-topic"
  # kms_master_key_id          = aws_kms_key.example_key.key_id
}

# Configure the SNS subscription
resource "aws_sns_topic_subscription" "my_sns_subscription" {
  topic_arn = aws_sns_topic.my_sns_topic.arn
  protocol  = "lambda"
  endpoint  = "arn:aws:lambda:eu-west-1:411194033911:function:my_lambda_function"
}
