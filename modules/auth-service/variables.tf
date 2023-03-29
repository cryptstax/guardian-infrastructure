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
