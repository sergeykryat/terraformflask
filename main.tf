provider "kubernetes" {
  config_path = "~/.minicube/config"
}
resource "kubernetes_namespace" "application" {
  metadata {
    name = "application"
    labels = {
      limits = var.limits
      rbac   = var.rbac ? "enabled" : "disabled"
    }
  }
}