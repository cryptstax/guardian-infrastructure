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

resource "docker_image" "mrv_sender" {
  name = var.mrv_sender_image
  build {
    context    = var.mrv_sender_build_context
    dockerfile = var.mrv_sender_dockerfile
  }
}

resource "docker_container" "mrv_sender" {
  image   = docker_image.mrv_sender.name
  name    = "mrv-sender"
  restart = "always"
  ports {
    internal = 9100
    external = 9100
  }
}
