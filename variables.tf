variable "ME_CONFIG_MONGODB_SERVER" {
  description = "MongoDB server hostname"
  default     = "mongo"
}

variable "ME_CONFIG_MONGODB_PORT" {
  description = "MongoDB server port"
  default     = 27017
}

variable "ME_CONFIG_SITE_BASEURL" {
  description = "Base URL for Mongo-Express"
  default     = "/mongo-admin"
}

variable "VAULT_SERVER" {
  description = "Vault server URL"
  default     = "http://0.0.0.0:8200"
}

variable "VAULT_DEV_ROOT_TOKEN_ID" {
  description = "Vault development root token ID"
  default     = "1234"
}

variable "docker_image" {
  type = string
}

variable "docker_ports" {
  type = list(string)
}

variable "docker_environment" {
  type = map(string)
}

variable "docker_volumes" {
  type = list(string)
}

variable "docker_command" {
  type = string
}

variable "docker_build_context" {
  type = string
}

variable "docker_build_dockerfile" {
  type = string
}