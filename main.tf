resource "kubernetes_namespace" "terraform-minikube" {
    metadata {
        name = var.name
    }
}

resource "kubernetes_deployment" "nginx" {
    metadata {
        name = "nginx"
        namespace = kubernetes_namespace.terraform-minikube.metadata.0.name
    }
    spec {

        replicas = 2
        selector {
            match_labels = {
                app = "nginx"
            }
        }
        template {
            metadata {
                labels = {
                    app = "nginx"
                }
            }

            spec {
                container {
                    image = "nginx"
                    name = "nginx"
                    port {
                        container_port = 80
                    }
                    resources {
                        limits = {
                            cpu    = "0.5"
                            memory = "512Mi"
                        }
                        requests = {
                            cpu    = "250m"
                            memory = "50Mi"
                        }
          }
                }
            }
        }

    }

}

resource "kubernetes_service" "nginx" {
    metadata {
        name = "nginx"
        namespace = kubernetes_namespace.terraform-minikube.metadata.0.name

    }
    spec {
        selector = {
            app = kubernetes_deployment.nginx.spec.0.template.0.metadata.0.labels.app
        }
        port {
            port = 80
        }
    }
}