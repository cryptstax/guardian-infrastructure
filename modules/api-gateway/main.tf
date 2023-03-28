resource "docker_image" "api_gateway" {
  name = var.api_gateway_image
  build {
    context    = var.api_gateway_build_context
    dockerfile = var.api_gateway_dockerfile
  }
}

resource "docker_container" "api_gateway" {
  name  = var.api_gateway_image
  image = docker_image.api_gateway.latest

  ports {
    internal = var.api_gateway_exposed_port
  }

  networks_advanced {
    name = var.app_network_name
  }
}