terraform {
  required_providers {
    # Kubernetes provider
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    # Helm provider
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig
  }
}