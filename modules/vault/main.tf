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

resource "docker_image" "vault" {
  name = var.vault_image
}

resource "docker_container" "vault" {
  image   = docker_image.vault.name
  name    = "vault"
  restart = "always"

  environment = {
    VAULT_SERVER            = var.vault_server
    VAULT_DEV_ROOT_TOKEN_ID = var.vault_dev_root_token_id
  }

  expose {
    internal = var.vault_expose_port
  }

  ports {
    internal = var.vault_expose_port
    external = var.vault_expose_port
  }

  volumes {
    host_path      = "./file"
    container_path = "/vault/file"
    read_only      = false
  }
  volumes {
    host_path      = "./config"
    container_path = "/vault/config"
    read_only      = false
  }

  capabilities = ["IPC_LOCK"]
}
