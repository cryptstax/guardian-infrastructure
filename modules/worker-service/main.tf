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

resource "docker_image" "worker-service" {
  name = var.worker_service_image
  build {
    context    = var.worker_service_context
    dockerfile = var.worker_service_dockerfile
  }
}

resource "docker_container" "worker-service" {
  image   = docker_image.worker-service.name
  name    = "${var.service_channel}-worker-service"
  restart = "always"

  env = [
    "SERVICE_CHANNEL=${var.service_channel}",
  ]

  depends_on = [
    docker_container.auth_service,
    docker_container.ipfs_node
  ]
}
