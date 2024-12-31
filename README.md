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

1. Create a Fargate Profile for the Cluster
```bash
eksctl create fargateprofile --cluster eks-game-cluster --region us-east-1 --name alb-sample-app --namespace game-2048
```

2. Set up IAM OIDC provider:
Run the following command to associate the IAM OIDC provider with your EKS cluster:
```bash
./iam/eksctl-oidc-setup.sh
```

3. Create Service Account for the Load Balancer Controller:
Execute the script to create the service account and attach the IAM policy:
```bash
./iam/eksctl-service-account.sh
```
4. Install AWS Load Balancer Controller:
Run the Helm command to install the AWS Load Balancer Controller:
```bash
./helm/install-load-balancer-controller.sh
```
5. Deploy Kubernetes Resources:
Apply the Kubernetes YAML files to deploy your application:
```bash
kubectl apply -f kubernetes/namespace.yml
kubectl apply -f kubernetes/deployment.yml
kubectl apply -f kubernetes/service.yml
kubectl apply -f kubernetes/ingress.yml
```

