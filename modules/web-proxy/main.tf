resource "docker_image" "web_proxy" {
  name = var.web_proxy_image
  build {
    context = var.web_proxy_build_context
  }
}

resource "docker_container" "web_proxy" {
  image = docker_image.web_proxy.latest
  name  = "web_proxy"
  ports {
    internal = 80
    external = var.web_proxy_port
  }
  depends_on = [
    docker_container.guardian_service,
    docker_container.auth_service,
    docker_container.api_gateway,
    docker_container.api_docs,
    docker_container.mrv_sender,
    docker_container.mongo_express,
  ]
}

