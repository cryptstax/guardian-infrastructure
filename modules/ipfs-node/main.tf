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

resource "docker_image" "ipfs_node" {
  name = var.ipfs_node_image
}

resource "docker_container" "ipfs_node" {
  image   = docker_image.ipfs_node.name
  name    = "ipfs-node"
  restart = "always"
  ports {
    internal = 5001
    external = 5001
  }
  ports {
    internal = 5002
    external = 5002
  }
  ports {
    internal = 4001
    external = 4001
  }
  ports {
    internal = 4002
    external = 4002
  }
  ports {
    internal = 8080
    external = 8080
  }
  ports {
    internal = 8081
    external = 8081
  }
  volumes {
    container_path = "/export"
    host_path      = "./runtime-data/ipfs/staging"
    read_only      = false
  }
  volumes {
    container_path = "/data/ipfs"
    host_path      = "./runtime-data/ipfs/data"
    read_only      = false
  }
}
