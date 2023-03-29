# WORK IN PROGRESS

variable "app_network_name" {
  type        = string
  description = "The name of the network to connect the vault container to."
}

variable "vault_image" {
  type        = string
  description = "The Docker image for the vault service."
  default     = "vault:1.12.2"
}

variable "vault_server" {
  type        = string
  description = "The Vault server URL."
  default     = "http://0.0.0.0:8200"
}

variable "vault_dev_root_token_id" {
  type        = string
  description = "The root token ID for the Vault development server."
  default     = "1234"
}

variable "vault_expose_port" {
  type        = string
  description = "The port to expose the vault container on."
  default     = "8200"
}

variable "vault_ports" {
  type        = list(string)
  description = "The list of ports to map from the host to the container."
  default     = ["8200:8200"]
}

variable "vault_ipc_lock" {
  type        = list(string)
  description = "The list of Linux capabilities to add to the vault container."
  default     = ["IPC_LOCK"]
}

variable "vault_volumes" {
  type        = list(string)
  description = "The list of volume bindings for the vault container."
  default = [
    "./file:/vault/file:rw",
    "./config:/vault/config:rw",
  ]
}