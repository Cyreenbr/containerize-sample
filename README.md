# Containerize Sample App
A simple Node.js app containerized with Docker and automated using GitHub Actions CI.

---

## Project Overview
This project demonstrates basic **DevOps practices**:
- **Docker multi-stage build** → small, production-ready image  
- **GitHub Actions CI** → automatic lint & build  
- **ESLint & Hadolint** → code & Dockerfile quality  
- **Kubernetes (Kind)** → local orchestration testing

---

## Setup & Run Locally

### 1. Clone the repository
```bash
git clone https://github.com/Cyreenbr/containerize-sample.git
cd containerize-sample
```

### 2. Install dependencies
```bash
cd app
npm install
npm run lint
```

### 3. Run locally
```bash
npm start
```
App runs on http://localhost:3000

### Docker
```bash
docker build -t containerize-sample .
docker run -p 3000:3000 containerize-sample
docker-compose up --build
```

### Kubernetes (Kind)
```bash
kind create cluster --name mykind
kind load docker-image containerize-sample:local --name mykind
kubectl apply -f k8s/
kubectl port-forward svc/containerize-sample-svc 8080:80
```