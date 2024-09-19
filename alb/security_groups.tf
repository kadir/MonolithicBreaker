resource "aws_security_group" "sg_a" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "sg-load-balancer"

  # Inbound HTTPS (443) traffic from the public internet
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules for ALB (allow all traffic out)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
