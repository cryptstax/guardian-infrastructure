terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2" # Replace this with the desired version
    }
  }
}

provider "docker" {
  alias = "kreuzwerker"
}

resource "docker_image" "web-proxy" {
  name = var.web_proxy_image
  build {
    context    = var.web_proxy_context
    dockerfile = var.web_proxy_dockerfile
  }
}

resource "docker_container" "web-proxy" {
  image   = docker_image.web-proxy.name
  name    = "web-proxy"
  restart = "always"

  ports {
    internal = var.web_proxy_internal_port
    external = var.web_proxy_external_port
  }

  depends_on = [
    docker_container.auth_service,
    docker_container.api_docs,
    docker_container.api_gateway,
    docker_container.guardian_service,
    docker_container.mongo-express,
    docker_container.mrv-sender
  ]
}
