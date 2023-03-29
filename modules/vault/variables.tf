# variable "docker_volumes" {
#   description = "Docker volumes for services"
#   type = list(object({
#     service_name   = string
#     host_path      = string
#     container_path = string
#     access_mode    = string
#   }))
#   default = [
#     {
#       service_name   = "vault"
#       host_path      = "./file"
#       container_path = "/vault/file"
#       access_mode    = "rw"
#     },
#     {
#       service_name   = "vault"
#       host_path      = "./config"
#       container_path = "/vault/config"
#       access_mode    = "rw"
#     }
#   ]
# }

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

variable "vault_file_path" {
  type        = string
  description = "The absolute path to the Vault file directory on the host."
}

variable "vault_config_path" {
  type        = string
  description = "The absolute path to the Vault configuration directory on the host."
}