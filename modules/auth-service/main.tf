resource "docker_image" "auth_service" {
  name         = var.auth_service_image
  build {
    context    = var.auth_service_build_context
    dockerfile = var.auth_service_dockerfile
  }
}

resource "docker_container" "auth_service" {
  name  = var.auth_service_image
  image = docker_image.auth_service.latest

  networks_advanced {
    name = var.app_network_name
  }
}