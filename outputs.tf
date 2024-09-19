output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "rds_endpoint" {
  description = "RDS endpoint URL"
  value       = module.rds.db_instance_endpoint
}

output "alb_dns" {
  description = "DNS Name for the Application Load Balancer"
  value       = aws_lb.app_load_balancer.dns_name
}