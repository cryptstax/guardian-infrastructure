variable "policy_service_image" {
  description = "Docker image for the policy-service"
  type        = string
}

variable "policy_service_build_context" {
  description = "Build context path for the policy-service"
  type        = string
}

variable "policy_service_dockerfile" {
  description = "Dockerfile path for the policy-service"
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

variable "message_broker_dependency" {
  description = "This depends_on the container for the message-broker service"
  type        = string
}

variable "mongo_dependency" {
  description = "This depends_on the container for the mongo service"
  type        = string
}
