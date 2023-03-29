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
    var.auth_service_dependency,
    var.logger_service_dependency,
    var.message_broker_dependency,
    var.mongo_dependency,
    var.policy_service_dependency,
    var.worker_service_1_dependency,
    var.worker_service_2_dependency
  ]
}
