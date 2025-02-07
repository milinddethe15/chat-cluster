#!/bin/bash

set -e

# Check if K8S_NAMESPACE is set, otherwise use "default"
K8S_NAMESPACE=${K8S_NAMESPACE:-default}

# Setup Kubeconfig
echo $KUBE_CONFIG | base64 -d > kubeconfig
export KUBECONFIG=kubeconfig

# Apply Kubernetes Manifests
kubectl apply -f k8s_manifest/

# Restart deployments to use new images
kubectl rollout restart deployment/chat-backend -n $K8S_NAMESPACE
kubectl rollout restart deployment/chat-frontend -n $K8S_NAMESPACE

# Clean up
rm kubeconfig