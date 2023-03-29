# WORK IN PROGRESS

resource "docker_container" "vault" {

  name    = "vault"
  image   = var.vault_image
  restart = "always"
  expose  = [var.vault_expose_port]

  environment = [
    "VAULT_SERVER=${var.vault_server}",
    "VAULT_DEV_ROOT_TOKEN_ID=${var.vault_dev_root_token_id}",
  ]
  networks_advanced {
    name = var.app_network_name
  }
  capabilities {
    add = var.vault_ipc_lock
  }
  volumes = var.vault_volumes
}

resource "docker_image" "vault" {
  name = var.vault_image
}