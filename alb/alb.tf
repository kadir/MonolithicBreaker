resource "aws_lb" "app_load_balancer" {
  name               = "app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_a.id]
  subnets            = [aws_subnet.public_subnet.id]

  enable_deletion_protection = true
}
