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

resource "docker_image" "topic_viewer" {
  name = var.topic_viewer_image
  build {
    context    = var.topic_viewer_build_context
    dockerfile = var.topic_viewer_dockerfile
  }
}

resource "docker_container" "topic_viewer" {
  image = docker_image.topic_viewer.name
  name  = "topic-viewer"
  ports {
    internal = 3006
    external = 3006
  }
}