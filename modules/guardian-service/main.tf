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

resource "docker_image" "guardian_service" {
  name = var.guardian_service_image
  build {
    context    = var.guardian_service_build_context
    dockerfile = var.guardian_service_dockerfile
  }
}

resource "docker_container" "guardian_service" {
  image   = docker_image.guardian_service.name
  name    = "guardian-service"
  restart = "always"
  depends_on = [
    docker_container.mongo,
    docker_container.message_broker,
    docker_container.auth_service,
    docker_container.logger_service,
    docker_container.worker_service_1,
    docker_container.worker_service_2,
    docker_container.policy_service
  ]
}
