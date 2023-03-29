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

resource "docker_image" "mongo" {
  name = var.mongo_image
}

resource "docker_container" "mongo" {
  image   = docker_image.mongo.name
  name    = "mongo"
  command = var.mongo_command
  restart = "always"
  expose {
    internal = var.mongo_expose_port
  }
}
