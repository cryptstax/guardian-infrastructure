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
