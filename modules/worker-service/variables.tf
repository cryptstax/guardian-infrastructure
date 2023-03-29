variable "worker_service_build_context" {
  description = "The build context for the worker-service."
  default     = "."
}

variable "worker_service_dockerfile" {
  description = "The Dockerfile for the worker-service."
  default     = "./guardian/worker-service/Dockerfile"
}

variable "worker_service_image" {
  description = "The image name for the worker-service."
  default     = "worker-service"
}

variable "worker_service_1_channel" {
  description = "The service channel for worker-service-1."
  default     = "worker.1"
}

variable "worker_service_2_channel" {
  description = "The service channel for worker-service-2."
  default     = "worker.2"
}

variable "app_network_name" {
  description = "The name of the app network."
  default     = "app-network"
}