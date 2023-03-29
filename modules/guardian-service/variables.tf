variable "guardian_service_image" {
  description = "Docker image for the guardian-service"
  type        = string
}

variable "guardian_service_build_context" {
  description = "Build context for the guardian-service"
  type        = string
}

variable "guardian_service_dockerfile" {
  description = "Dockerfile for the guardian-service"
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

variable "policy_service_dependency" {
  description = "This depends_on the container for the policy-service"
  type        = string
}

variable "worker_service_1_dependency" {
  description = "This depends_on the container for the worker-service-1"
  type        = string
}

variable "worker_service_2_dependency" {
  description = "This depends_on the container for the worker-service-2"
  type        = string
}