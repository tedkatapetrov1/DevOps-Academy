module "vpc" {
  source = "git::https://github.com/tedkatapetrov1/module.git//modules/ppppppp"

  vpc_cidr = "10.0.0.0/16"
  cidr_ranges = {
    public1  = "10.0.1.0/24"
    public2  = "10.0.2.0/24"
    private1 = "10.0.3.0/24"
    private2 = "10.0.4.0/24"
  }
  vpc_name = "my-exam-autoscaled-instances"
  autoscalingpgroup_name = "my-exam-autoscaling-group"
  autoscalingpolicy_name = "my-autoscaling-policy"
  cloudwatch_name = "my-cloudwatch-metric"
  lb_name = "my-load-balancer"
  lbtargetgroup_name = "my-alb-target-group"
  securitygroup_allowhttp_name = "allow-http"
  securitygroup_allowsec_name = "allow-sec1"
}

