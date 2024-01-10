terraform {
  required_providers {
    minikube = {
      source  = "hashicorp/minikube"
      version = "v1.6.6"  # Укажите версию провайдера
    }
  }
}
provider "minikube" {
  config_path = "~/.minicube/config"
}
resource "minikube_namespace" "application" {
  metadata {
    name = "application"
    labels = {
      limits = var.limits
      rbac   = var.rbac ? "enabled" : "disabled"
    }
  }
}