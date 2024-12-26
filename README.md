# AWS-EKS-Cluster-With-Ingress

This repository for setting up EKS clusters and configuring app deployment with Ingress using AWS Load Balancer Controller.


## Directory Structure

### /kubernetes/
- **namespace.yml**: Defines the namespace for the application.
- **deployment.yml**: Kubernetes deployment for the Game 2048 application.
- **service.yml**: Service to expose the application inside the cluster.
- **ingress.yml**: Ingress resource to expose the service using an AWS Application Load Balancer (ALB).

### /iam/
- **iam-policy.json**: IAM policy for granting necessary permissions to the AWS Load Balancer Controller.
- **eksctl-oidc-setup.sh**: Script to associate the IAM OIDC provider with the EKS cluster.
- **eksctl-service-account.sh**: Script to create the necessary service account with IAM roles.

### /helm/
- **install-load-balancer-controller.sh**: Script to install the AWS Load Balancer Controller using Helm.

