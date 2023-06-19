resource "aws_lb" "my_lb" {
  name               = "my-lb"
  load_balancer_type = "application"
  subnets = [
    aws_subnet.my_subnet_01.id,
    aws_subnet.my_subnet_02.id
  ]

  security_groups = [aws_security_group.example_lb_sg2.id]
}

resource "aws_lb_target_group" "my_tg" {
  name        = "my-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc_01.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
  }
}

resource "aws_autoscaling_attachment" "example_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.my_scalling_group.name
  lb_target_group_arn    = aws_lb_target_group.my_tg.arn
}

resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}

resource "aws_security_group" "example_lb_sg1" {
  name        = "example-lb-sg1"
  vpc_id      = aws_vpc.my_vpc_01.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc_01.cidr_block]
  }
}

resource "aws_security_group" "example_lb_sg2" {
  name        = "example-lb-sg2"
  vpc_id      = aws_vpc.my_vpc_01.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc_01.cidr_block]
  }
}
