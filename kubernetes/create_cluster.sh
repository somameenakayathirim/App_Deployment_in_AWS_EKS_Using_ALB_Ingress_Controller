eksctl create cluster --name eks-game-cluster --region us-east-1 --fargate  

aws eks update-kubeconfig --name eks-game-cluster --region us-east-1 

eksctl create fargateprofile  --cluster eks-game-cluster --region us-east-1 --name alb-sample-app --namespace game-2048