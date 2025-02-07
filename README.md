# Chat Cluster

A real-time chat application with WebSockets, JWT authentication, and Kubernetes deployment using ArgoCD & CI/CD.

## Features
- ✅ Real-time messaging using WebSockets
- ✅ User authentication with JWT tokens
- ✅ Containerized services with Docker
- ✅ Deployed on Kubernetes with Nginx as a reverse proxy
- ✅ Automated CI/CD using Jenkins, ArgoCD, and GitHub Webhooks

### Clone the repository

```bash
git clone https://github.com/milinddethe15/chat-cluster.git
cd chat-cluster
```

### Run Locally using Docker

Pre-requisites:
- `Docker` & `Docker Compose` installed

```bash 
docker-compose up -d
```
The backend will be available at http://localhost:5000.

The frontend will be available at http://localhost:3000.

### Deploy on Kubernetes

Pre-requisites:
- Kubernetes cluster
- kubectl & ArgoCD CLI installed
- Configured Jenkins Pipeline

Setup Kubernetes Manifests:
```bash 
kubectl create namespace chat-cluster
kubectl apply -f k8s_manifest/

#verify
kubectl get pods -n chat-cluster
kubectl get svc -n chat-cluster
```

Find the EXTERNAL-IP of chat-frontend and access the app in the browser.

If using `minikube`:
- use `minikube service chat-frontend -n chat-cluster` to access frontend in the browser.

> [!NOTE]  
> Kubernetes Manifests fetches images from my dockerhub repo. Edit manifest files to use your built images.

##  CI/CD Pipeline with Jenkins & ArgoCD

Pipeline Overview:
1. Jenkins builds and pushes Docker images to Docker Hub
2. ArgoCD syncs Kubernetes manifests to AKS
3. Automated deployment & monitoring

Trigger the Pipeline
- Automatically via GitHub Webhook
- Manually in Jenkins
