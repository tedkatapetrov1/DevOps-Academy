resource "aws_cloudwatch_metric_alarm" "my_running_instance_alarm" {
  alarm_name                = "my-running-instance-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 60
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors ec2 cpu utilization"
  
  alarm_actions             = [aws_sns_topic.my_sns_topic.arn]
}
