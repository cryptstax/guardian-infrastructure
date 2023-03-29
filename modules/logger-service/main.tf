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

resource "docker_image" "logger_service" {
  name = var.logger_service_image
  build {
    context    = var.logger_service_build_context
    dockerfile = var.logger_service_dockerfile
  }
}

resource "docker_container" "logger_service" {
  image   = docker_image.logger_service.name
  name    = "logger-service"
  restart = "always"
  ports {
    internal = 9000
    external = 9000
  }
  depends_on = [
    docker_container.message_broker
  ]
}
