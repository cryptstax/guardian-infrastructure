variable "guardian_service_build_context" {
  description = "The build context for the guardian-service."
  default     = "."
}

variable "guardian_service_dockerfile" {
  description = "The Dockerfile for the guardian-service."
  default     = "./guardian/guardian-service/Dockerfile"
}

variable "guardian_service_image" {
  description = "The image name for the guardian-service."
  default     = "guardian-service"
}

variable "app_network_name" {
  description = "The name of the app network."
  default     = "app-network"
}

