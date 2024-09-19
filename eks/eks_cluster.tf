resource "aws_eks_cluster" "k8s_cluster" {
  name     = "secure-bank-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
    security_group_ids = [aws_security_group.sg_b.id]
  }
}
