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

locals {
  ipfs_data_path    = abspath("${path.root}/${var.ipfs_data_path}")
  ipfs_staging_path = abspath("${path.root}/${var.ipfs_staging_path}")
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
    host_path      = local.ipfs_data_path
    container_path = "/data/ipfs"
    read_only      = false
  }
  volumes {
    host_path      = local.ipfs_staging_path
    container_path = "/export"
    read_only      = false
  }
}
