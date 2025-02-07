#!/bin/bash

set -e

# Define the namespace
NAMESPACE=chat-cluster

# Create the namespace if it doesn't exist
kubectl get namespace $NAMESPACE || kubectl create namespace $NAMESPACE

# Apply Kubernetes Manifests
kubectl apply -f k8s_manifest/ -n $NAMESPACE

# Restart deployments to use new images
kubectl rollout restart deployment/chat-backend -n $NAMESPACE
kubectl rollout restart deployment/chat-frontend -n $NAMESPACE
