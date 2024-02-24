# terraform_EKS-cluster_project
Provision an Elastic Kubernetes Service (EKS) cluster using these terraform scripts.

## Deploy EKS CLuster with Fargate using Terraform

### Prerequisites:
* Terraform installed on your PC/server
* An AWS Account with an IAM user profile 
* AWS CLI installed and configured on your PC/server
* Kubectl installed. Follow this url for installation guide **https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html**

#### Note for Fargate launch
* This cluster based on the current configuration will be created in the us-east-1 region and is setup to work only with fargate
* Rerun terraform apply again if you receive **Error: creating EC2 VPC: RequestError: send request failed
│ caused by: Post "https://ec2.us-east-1.amazonaws.com/": read tcp 192.168.1.71:53727->209.54.181.193:443: wsarecv: An existing connection was forcibly closed by the remote host.** and it should deploy the resources
* The deployment takes over 15 minutes

### Resources Created
* VPC and all networking components
* EKS cluster
* aws load balancer controller for ingress
* Fargate profiles for application, aws-load-balancer-controller and Kube-system namespaces

### Deployment Steps
```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply --auto-appprove
```

### steps after succesful deployment of cluster with terraform 

* After you provision the EKS with terraform, you would need to update your Kubernetes context to access the cluster with the following command - **aws eks update-kubeconfig --name name-of-cluster --region region-where-cluster-is-deployed**


* To patch coredns to run on fargate nodes, run the command below 
****
```bash
kubectl patch deployment coredns \
-n kube-system \
--type json \
-p='[{"op": "remove", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type"}]'
```
