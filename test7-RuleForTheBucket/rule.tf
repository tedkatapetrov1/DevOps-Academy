resource "aws_config_config_rule" "s3_bucket_encryption_rule" {
  name = "s3-bucket-encryption-rule"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }

  depends_on = [aws_sns_topic.s3_encryption_notification]
}

resource "aws_config_configuration_recorder" "default" {
  name      = "default"
  role_arn  = aws_iam_role.config_role.arn

  recording_group {
    all_supported = true
  }

  depends_on = [aws_config_delivery_channel.default]
}

resource "aws_config_configuration_recorder_status" "default" {
  name       = aws_config_configuration_recorder.default.name
  is_enabled = true
  depends_on = [aws_config_configuration_recorder.default]
}

resource "aws_config_delivery_channel" "default" {
  name        = "default"
  s3_bucket_name = "dimitar-manov-001"

  sns_topic_arn = aws_sns_topic.s3_encryption_notification.arn
}
