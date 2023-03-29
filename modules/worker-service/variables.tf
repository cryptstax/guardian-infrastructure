variable "worker_service_image" {
  type        = string
  description = "The Docker image for the worker-service."
  default     = "worker-service"
}

variable "worker_service_context" {
  type        = string
  description = "The build context for the worker-service."
}

variable "worker_service_dockerfile" {
  type        = string
  description = "The Dockerfile for the worker-service."
}

variable "service_channel" {
  type        = string
  description = "The service channel for the worker-service."
}
