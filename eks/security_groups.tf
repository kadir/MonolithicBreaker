resource "aws_security_group" "sg_b" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "sg-eks"

  # Inbound HTTP and HTTPS traffic from the ALB
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  # Outbound rules for EKS (allow all traffic out)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
