variable "auth_service_image" {
  description = "Docker image for the auth-service"
  type        = string
}

variable "auth_service_build_context" {
  description = "Build context for the auth-service"
  type        = string
}

variable "auth_service_dockerfile" {
  description = "Dockerfile for the auth-service"
  type        = string
}

variable "message_broker_dependency" {
  description = "This depends_on the container for the message-broker service"
  type        = string
}

variable "mongo_dependency" {
  description = "This depends_on the container for the mongo service"
  type        = string
}

variable "logger_service_dependency" {
  description = "This depends_on the container for the logger-service"
  type        = string
}

variable "vault_dependency" {
  description = "This depends_on the container for the vault service"
  type        = string
}