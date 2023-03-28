variable "auth_service_build_context" {
  description = "The build context for the auth-service."
  default     = "."
}

variable "auth_service_dockerfile" {
  description = "The Dockerfile for the auth-service."
  default     = "./guardian/auth-service/Dockerfile"
}

variable "auth_service_image" {
  description = "The image name for the auth-service."
  default     = "auth-service"
}

variable "app_network_name" {
  description = "The name of the app network."
  default     = "app-network"
}