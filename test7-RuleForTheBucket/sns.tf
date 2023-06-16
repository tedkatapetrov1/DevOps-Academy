resource "aws_sns_topic" "s3_encryption_notification" {
  name = "s3-encryption-notification"
}

resource "aws_sns_topic_subscription" "s3_encryption_notification_subscription" {
  topic_arn = aws_sns_topic.s3_encryption_notification.arn
  protocol  = "email"
  endpoint  = "dimitar_manov@flutterint.com"
}
