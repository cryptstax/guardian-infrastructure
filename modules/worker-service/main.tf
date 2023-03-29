resource "docker_image" "worker_service" {
  name = var.worker_service_image
  build {
    context    = var.worker_service_build_context
    dockerfile = var.worker_service_dockerfile
  }
}

resource "docker_container" "worker_service_1" {
  name  = "${var.worker_service_image}-1"
  image = docker_image.worker_service.latest

  env = [
    "SERVICE_CHANNEL=${var.worker_service_1_channel}"
  ]

  networks_advanced {
    name = var.app_network_name
  }
}

resource "docker_container" "worker_service_2" {
  name  = "${var.worker_service_image}-2"
  image = docker_image.worker_service.latest

  env = [
    "SERVICE_CHANNEL=${var.worker_service_2_channel}"
  ]

  networks_advanced {
    name = var.app_network_name
  }
}