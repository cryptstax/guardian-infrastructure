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

resource "docker_image" "api_docs" {
  name = var.api_docs_image
  build {
    context    = var.api_docs_build_context
    dockerfile = var.api_docs_dockerfile
  }
}

resource "docker_container" "api_docs" {
  image   = docker_image.api_docs.name
  name    = "api-docs"
  restart = "always"
  ports {
    internal = var.api_docs_expose_port
    external = var.api_docs_expose_port
  }
}
