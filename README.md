# EKS-Terraform

eks-terraform/ │── k8s/ # Kubernetes manifests for deploying applications
│ ├── python-app-deployment.yaml # Deployment manifest for the Python app
│ ├── python-app-service.yaml # Service manifest to expose the app
│
│── modules/ # Terraform modules for structured infrastructure
│ ├── eks/ # EKS cluster module
│ │ ├── main.tf # EKS resource definitions
│ │ ├── variables.tf # Input variables for customization
│ │ ├── outputs.tf # Outputs like cluster name and endpoint
│ │
│ ├── vpc/ # Virtual Private Cloud (VPC) module
│ │ ├── main.tf # VPC configuration (subnets, gateways, etc.)
│ │ ├── variables.tf # Configurable options for VPC
│ │ ├── outputs.tf # Outputs like VPC ID and subnet IDs
│ │
│ ├── iam/ # IAM roles and policies for EKS
│ │ ├── main.tf # IAM role creation
│ │ ├── outputs.tf # Outputs related to IAM roles
│
│── terraform.tfvars # Terraform variables for configuring resources
│── variables.tf # Defines the required variables
│── main.tf # Root Terraform file that ties all modules together
│── passrole-policy.json # JSON policy for IAM permissions
│── fix.sh # Script to auto-fix common Terraform issues
│── fixes.sh # Another fix script (might be redundant)
│── remove.sh # Script to clean up and destroy resources
│── README.md # This file! Explains the project structure
