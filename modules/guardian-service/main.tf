resource "docker_image" "auth_service" {
  name         = var.guardian_service_image
  build {
    context    = var.guardian_service_build_context
    dockerfile = var.guardian_service_dockerfile
  }
}

resource "docker_container" "guardian_service" {
  name  = var.guardian_service_image
  image = docker_image.guardian_service.latest

  networks_advanced {
    name = var.app_network_name
  }

  volumes {
    host_path      = "./guardian-service"
    container_path = "/app"
  }
}