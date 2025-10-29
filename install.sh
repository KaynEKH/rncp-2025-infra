#!/bin/bash

# Terraform
cd terraform || exit
terraform init
terraform apply -auto-approve

# Update Config K8S
aws eks update-kubeconfig --name datascientest --region eu-west-3
kubectl wait --for=condition=ready pod \
  -l app.kubernetes.io/name=aws-ebs-csi-driver \
  -n kube-system \
  --timeout=120s || echo "Warning: CSI Driver peut prendre plus de temps"

# Ansible
cd ../ansible || exit

python3 -m venv .venv
. .venv/bin/activate
pip install ansible-core==2.15.13 ansible-runner==2.4.2 kubernetes openshift PyYAML

ansible-galaxy collection install -r requirements.yml
ansible-playbook -i inventory.yml playbook.yml --vault-password-file .vault_pass