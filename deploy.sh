#!/bin/bash

set -e

# Setup Kubeconfig
echo $KUBE_CONFIG | base64 -d > kubeconfig
export KUBECONFIG=kubeconfig

# Apply Kubernetes Manifests
kubectl apply -f k8s/

# Restart deployments to use new images
kubectl rollout restart deployment/chat-backend -n $K8S_NAMESPACE
kubectl rollout restart deployment/chat-frontend -n $K8S_NAMESPACE

# Clean up
rm kubeconfig