# **MonolithicBreaker:**


---

## **Project Overview**

This project is designed to deploy a microservices-based architecture with security best practices, auto-scaling, and high availability in **AWS EU (Ireland)** (`eu-west-1`). The infrastructure is divided into public and private subnets, utilizing various AWS services to ensure secure and reliable operations.

---

### **Key Components**

- **Amazon VPC** with both public and private subnets
- **Application Load Balancer (ALB)** in the public subnet for incoming traffic routing
- **Amazon EKS (Elastic Kubernetes Service)** in the private subnet for containerized applications
- **Amazon RDS (MySQL) with RDS Proxy** for database management and connection pooling
- **AWS Secrets Manager** for secure credentials storage
- **Terraform** for Infrastructure as Code (IaC)

---

1. Start by cloning the repository to your local machine::

    ```
    git clone https://github.com/kadir/MonolithicBreaker.git
    cd MonolithicBreaker
    ```
2. Navigate to the project folder and initialize Terraform. This will download the necessary providers and modules:

    ```
    terraform init
    terraform apply -auto-approve
    ```
3. Configure AWS Secrets Manager:

    ```
    aws secretsmanager create-secret --name RDSDatabasePassword --secret-string "YourSecurePassword"
    ```
4. Once the EKS cluster is up, configure kubectl to interact with the cluster::

    ```
    aws eks --region eu-west-1 update-kubeconfig --name secure-bank-cluster
    ```
5. Deploy your containerized application on the EKS cluster using Kubernetes manifests. For example, to deploy a basic NGINX application:

    ```
    kubectl create deployment nginx --image=nginx
    kubectl expose deployment nginx --port=80 --type=LoadBalancer
    ```
5. After deploying the application, get the Application Load Balancer (ALB) DNS name::

    ```
    aws elbv2 describe-load-balancers --region eu-west-1
    ```

When you're done, you can tear down the entire infrastructure using Terraform:
    ```
    terraform destroy -auto-approve
    ```


