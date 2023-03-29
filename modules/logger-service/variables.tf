variable "logger_service_image" {
  description = "Docker image for the logger-service"
  type        = string
}

variable "logger_service_build_context" {
  description = "Build context for the logger-service"
  type        = string
}

variable "logger_service_dockerfile" {
  description = "Dockerfile for the logger-service"
  type        = string
}
