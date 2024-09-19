# Public Subnet for ALB
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-1a"
}

# Private Subnet for EKS and RDS
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "eu-west-1a"
}
