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

resource "docker_image" "api_gateway" {
  name = var.api_gateway_image
  build {
    context    = var.api_gateway_build_context
    dockerfile = var.api_gateway_dockerfile
  }
}

resource "docker_container" "api_gateway" {
  image   = docker_image.api_gateway.name
  name    = "api-gateway"
  restart = "always"
  ports {
    internal = var.api_gateway_expose_port
    external = var.api_gateway_expose_port
  }
  depends_on = [
    docker_container.mongo,
    docker_container.message_broker,
    docker_container.guardian_service,
    docker_container.auth_service,
    docker_container.logger_service
  ]
}
