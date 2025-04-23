
# Frontend

This is the frontend microservice of a distributed TODO application built with a microservices architecture. It provides the user interface (UI) that interacts with the backend APIs responsible for authentication and task management.

---

## 🔗 Project Links

- 📋 [Trello Board](https://trello.com/invite/b/680296aa17864e87fc6c7fed/ATTI82505e108ae3e7a005ede0081ec437f87CDDDEF1/microservice)
- 📄 [Project Documentation](https://docs.google.com/document/d/1FER2lpkZJk2eI5tpMnMy8mFhd42g3f4jioasHwZ0klo/edit?usp=sharing)

## 🌐 Live Access

-  [Frontend Web Application](http://51.8.61.254)
- [Zipkin Distributed Tracing](http://135.234.184.116:9411)


## Architecture & Deployment

This service is containerized with Docker and deployed to Azure Kubernetes Service (AKS). The image is built and published automatically via GitHub Actions and deployed using Kubernetes manifests.

Environment variables like `AUTH_API_ADDRESS` and `TODOS_API_ADDRESS` are defined to allow communication with the corresponding APIs.

## 📦 Dependencies

This project uses the following versions for development and production:

| Dependency | Version |
|------------|---------|
| Node.js    | 8.17.0  |
| NPM        | 6.13.4  |

---

# 🛠️ What Was Added – `ms-frontend` Microservice

## 🐳 Containerization

A Dockerfile was created to build a container image for the frontend service using a Node.js base image. This process installs dependencies, builds the application, and exposes port 8080 for incoming requests.

Environment variables were also defined to enable proper communication with other microservices (`auth-api` and `todos-api`).

---

## ☸️ Kubernetes Deployment

Two Kubernetes manifests were added:

- **Deployment:** Configures how the frontend is deployed in the cluster, specifying the use of a container image hosted in Azure Container Registry.
- **Service:** Exposes the deployment externally via a `LoadBalancer`, redirecting public traffic from port 80 to the internal container port 8080.

---

## 🔁 CI/CD Automation with GitHub Actions

A GitHub Actions workflow was integrated to automate the build and deployment process when code is pushed to the `main` branch. The workflow performs the following:

1. Logs into Azure and the container registry.
2. Builds the Docker image for the frontend.
3. Pushes the image to Azure Container Registry with `latest` and commit hash tags.
4. Applies the Kubernetes manifests.
5. Updates the deployment with the new image version.
6. Retrieves the public IP assigned by the LoadBalancer.

This ensures reliable, traceable, and automated deployments.

---

## 📣 Slack Notification

An additional GitHub Actions workflow was included to send a Slack notification to a specific channel whenever a push to the `main` branch is detected. This helps the team stay informed about repository changes in real time.

## Security & Code Quality
To ensure the reliability and security of the frontend microservice, we integrated automated tools into our CI/CD pipeline:

### 🔍 Trivy – Vulnerability Scanner
Usage: Scans Docker images for OS packages and application dependencies for known vulnerabilities (CVEs).

Pipeline Integration: Runs after the Docker image is built but before pushing to ACR.

Outcome: Blocks deployments that contain critical vulnerabilities.

### ✅ SonarCloud – Code Quality Analysis
Usage: Performs static code analysis to detect bugs, code smells, and security hotspots.

Pipeline Integration: Triggered on each pull request and push to main branch.

Outcome: Enforces quality gates. Builds fail if code quality thresholds are not met.

## <b> Made by </b>

+ [Fabiana Valderruten](https://github.com/FFabianna "FFabianna")
+ [Gloria Vicuña](https://github.com/Vanesa155 "Vanesa V.")

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)