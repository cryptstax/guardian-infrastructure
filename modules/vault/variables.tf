variable "vault_image" {
  type        = string
  description = "The Docker image for the Vault service."
}

variable "vault_server" {
  type        = string
  description = "The Vault server address."
}

variable "vault_dev_root_token_id" {
  type        = string
  description = "The Vault development root token ID."
}

variable "vault_expose_port" {
  type        = number
  description = "The port to expose the Vault service."
  default     = 8200
}
