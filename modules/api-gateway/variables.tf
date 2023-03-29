variable "api_gateway_image" {
  description = "Docker image for the api-gateway service"
  type        = string
}

variable "api_gateway_build_context" {
  description = "Build context for the api-gateway service"
  type        = string
}

variable "api_gateway_dockerfile" {
  description = "Dockerfile for the api-gateway service"
  type        = string
}

variable "api_gateway_expose_port" {
  description = "Port to expose the api-gateway service"
  type        = number
}

variable "mongo_dependency" {
  description = "This depends_on the container for the mongo service"
  type        = string
}

variable "message_broker_dependency" {
  description = "This depends_on the container for the message-broker service"
  type        = string
}

variable "guardian_service_dependency" {
  description = "This depends_on the container for the guardian-service"
  type        = string
}

variable "auth_service_dependency" {
  description = "This depends_on the container for the auth-service"
  type        = string
}

variable "logger_service_dependency" {
  description = "This depends_on the container for the logger-service"
  type        = string
}