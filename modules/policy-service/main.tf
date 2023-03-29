resource "docker_image" "policy_service" {
  name = var.policy_service_image
  build {
    context    = var.policy_service_build_context
    dockerfile = var.policy_service_dockerfile
  }
}

resource "docker_container" "policy_service" {
  name  = var.policy_service_image
  image = docker_image.policy_service.latest

  networks_advanced {
    name = var.app_network_name
  }
}