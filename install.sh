#!/bin/bash
cd terraform || exit
terraform init
terraform apply -auto-approve
cd ../ansible || exit
aws eks update-kubeconfig --name datascientest --region eu-west-3
kubectl wait --for=condition=ready pod \
  -l app.kubernetes.io/name=aws-ebs-csi-driver \
  -n kube-system \
  --timeout=120s || echo "Warning: CSI Driver peut prendre plus de temps"
ansible-galaxy collection install community.kubernetes
ansible-playbook -i inventory.yml playbook.yml -e @vars.yaml