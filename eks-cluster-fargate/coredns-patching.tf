# # Patching coredns pod to run on Fargate instead of default ec2 instance
# data "aws_eks_cluster_auth" "eks" {
#   name = aws_eks_cluster.cluster.id
# }

# resource "null_resource" "k8s_patcher" {
#   depends_on = [aws_eks_fargate_profile.kube-system]

#   triggers = {
#     endpoint = aws_eks_cluster.cluster.endpoint
#     ca_crt   = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
#     token    = data.aws_eks_cluster_auth.eks.token
#   }

#   provisioner "local-exec" {
#     command = <<EOH
# cat >/tmp/ca.crt <<EOF
# ${base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)}
# EOF
# kubectl \
#   --server="${aws_eks_cluster.cluster.endpoint}" \
#   --certificate_authority=/tmp/ca.crt \
#   --token="${data.aws_eks_cluster_auth.eks.token}" \
#   patch deployment coredns \
#   -n kube-system --type json \
#   -p='[{"op": "remove", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type"}]'
# EOH
#   }

#   lifecycle {
#     ignore_changes = [triggers]
#   }
# }
