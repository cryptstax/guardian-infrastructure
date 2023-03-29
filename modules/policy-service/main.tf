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

resource "docker_image" "policy_service" {
  name = var.policy_service_image
  build {
    context    = var.policy_service_build_context
    dockerfile = var.policy_service_dockerfile
  }
}

resource "docker_container" "policy_service" {
  image   = docker_image.policy_service.name
  name    = "policy-service"
  restart = "always"
  ports {
    internal = 9200
    external = 9200
  }
  depends_on = [
    var.auth_service_dependency,
    var.logger_service_dependency,
    var.message_broker_dependency,
    var.mongo_dependency
  ]
}