This project automates the deployment of a Python application on Amazon EKS using Terraform and Kubernetes. It provisions the necessary AWS infrastructure, including VPC, subnets, security groups, and an EKS cluster, and deploys a containerized Python application with Kubernetes manifests.

**Features**

✅ Infrastructure as Code (IaC) using Terraform

✅ Automated VPC, subnets, and security group creation

✅ EKS Cluster provisioning for Kubernetes workloads

✅ Kubernetes Deployment and Service for Python App

✅ Load Balancer for external access

✅ Modular Terraform structure for reusability

**Project Structure**

```
eks-terraform/
│── k8s/                          # Kubernetes manifests  
│   ├── python-app-deployment.yaml  
│   ├── python-app-service.yaml  
│  
│── modules/                      # Terraform modules  
│   ├── eks/                      # EKS cluster setup  
│   │   ├── main.tf  
│   │   ├── variables.tf  
│   │   ├── outputs.tf  
│   ├── vpc/                      # VPC and networking  
│       ├── main.tf  
│       ├── variables.tf  
│       ├── outputs.tf  
│  
│── .terraform/                    # Terraform state directory  
│── main.tf                         # Root Terraform config  
│── provider.tf                      # AWS Provider configuration  
│── terraform.tfvars                 # Variables for Terraform  
│── variables.tf                     # Input variables  
│── passrole-policy.json              # IAM role permissions  
│── README.md                         # Project Documentation  
```

**Prerequisites**

Before running the project, ensure you have:

-Terraform installed (≥ v1.0)

-AWS CLI configured with necessary permissions

-kubectl installed for managing the Kubernetes cluster

-Docker installed for building container images

-Git for version control


**Setup & Deployment**

Step 1: Clone the Repository
```
git clone https://github.com/your-repo/eks-terraform.git
cd eks-terraform
```
Step 2: Initialize Terraform
```
terraform init
```

Step 3: Plan and Apply Terraform Configuration
```
terraform plan
terraform apply -auto-approve
```

Step 4: Verify EKS Cluster
```
aws eks --region us-east-1 update-kubeconfig --name eks-python-cluster
kubectl get nodes
```

Step 5: Deploy Python App to EKS
```
kubectl apply -f k8s/python-app-deployment.yaml
kubectl apply -f k8s/python-app-service.yaml
```

Step 6: Get the Application URL
```
kubectl get svc python-app-service
```
Copy the EXTERNAL-IP and access your app in the browser.

**Next Steps**

-Implement CI/CD with GitHub Actions or GitLab CI/CD

-Add monitoring using Prometheus & Grafana

-Enable autoscaling for the Python app
