resource "aws_autoscaling_group" "my_scalling_group" {
  name                 = "my-scalling-group"
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
  vpc_zone_identifier = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
  target_group_arns = [aws_lb_target_group.my_tg.arn]
}

resource "aws_launch_template" "launch_template" {
  name                   = "launch-template"
  image_id               = data.aws_ami.latest_amazon_linux.image_id
  instance_type          = "t2.micro"
  update_default_version = true
  vpc_security_group_ids = [aws_security_group.example_lb_sg1.id]
  iam_instance_profile {
    name = aws_iam_instance_profile.dev-resources-iam-profile.name
  }
  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    amazon-linux-extras install -y nginx1
    systemctl enable nginx --now
    EOF
  )
}