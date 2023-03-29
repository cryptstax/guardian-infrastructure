variable "logger_service_build_context" {
  description = "The build context for the logger-service."
  default     = "."
}

variable "logger_service_dockerfile" {
  description = "The Dockerfile for the logger-service."
  default     = "./guardian/logger-service/Dockerfile"
}

variable "logger_service_image" {
  description = "The image name for the logger-service."
  default     = "logger-service"
}

variable "app_network_name" {
  description = "The name of the app network."
  default     = "app-network"
}