resource "docker_image" "logger_service" {
  name = var.logger_service_image
  build {
    context    = var.logger_service_build_context
    dockerfile = var.logger_service_dockerfile
  }
}

resource "docker_container" "logger_service" {
  name  = var.logger_service_image
  image = docker_image.logger_service.latest

  networks_advanced {
    name = var.app_network_name
  }
}