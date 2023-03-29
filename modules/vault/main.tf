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
  vault_file_path   = abspath("${path.root}/${var.vault_file_path}")
  vault_config_path = abspath("${path.root}/${var.vault_config_path}")
}

resource "docker_image" "vault" {
  name = var.vault_image
}

resource "docker_container" "vault" {
  image   = docker_image.vault.name
  name    = "vault"
  restart = "always"

  env = [
    "VAULT_SERVER=${var.vault_server}",
    "VAULT_DEV_ROOT_TOKEN_ID=${var.vault_dev_root_token_id}"
  ]

  ports {
    internal = var.vault_expose_port
    external = var.vault_expose_port
  }

  volumes {
    host_path      = local.vault_file_path
    container_path = "/vault/file"
    read_only      = false
  }
  volumes {
    host_path      = local.vault_config_path
    container_path = "/vault/config"
    read_only      = false
  }
  # Required for Vault https://developer.hashicorp.com/vault/docs/configuration#disable_mlock
  capabilities {
    add = ["IPC_LOCK"]
  }
}
