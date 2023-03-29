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

resource "docker_image" "message_broker" {
  name = var.message_broker_image
}

resource "docker_container" "message_broker" {
  image   = docker_image.message_broker.name
  name    = "message-broker"
  restart = "always"
  ports {
    internal = 5672
    external = 5672
  }
  ports {
    internal = 15672
    external = 15672
  }
}
