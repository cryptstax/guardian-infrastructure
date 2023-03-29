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

resource "docker_image" "auth_service" {
  name = var.auth_service_image
  build {
    context    = var.auth_service_build_context
    dockerfile = var.auth_service_dockerfile
  }
}

resource "docker_container" "auth_service" {
  image   = docker_image.auth_service.name
  name    = "auth-service"
  restart = "always"
  depends_on = [
    docker_container.mongo,
    docker_container.vault,
    docker_container.message_broker,
    docker_container.logger_service
  ]
}
