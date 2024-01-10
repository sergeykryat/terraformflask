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