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
  command = ["--setParameter", "allowDiskUseByDefault=true"]
  restart = "always"
  ports {
    internal = var.mongo_expose_port
    external = var.mongo_expose_port
  }
}
