resource "docker_image" "api_docs" {
  name = var.api_docs_image
  build {
    context    = var.api_docs_build_context
    dockerfile = var.api_docs_dockerfile
  }
}

resource "docker_container" "api_docs" {
  name  = var.api_docs_image
  image = docker_image.api_docs.latest
  ports {
    internal = 3001
    external = 3001
  }
  networks_advanced {
    name = var.app_network_name
  }
}