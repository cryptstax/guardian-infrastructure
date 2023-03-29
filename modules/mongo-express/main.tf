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

resource "docker_image" "mongo-express" {
  name = var.mongo_express_image
}

resource "docker_container" "mongo-express" {
  image   = docker_image.mongo-express.name
  name    = "mongo-express"
  restart = "always"
  ports {
    internal = var.mongo_express_expose_port
    external = var.mongo_express_expose_port
  }
  env = [
    "ME_CONFIG_MONGODB_SERVER=${var.mongo_container_name}",
    "ME_CONFIG_MONGODB_PORT=${var.mongo_expose_port}",
    "ME_CONFIG_SITE_BASEURL=${var.mongo_express_baseurl}"
  ]
  depends_on = [var.mongo_dependency]
}