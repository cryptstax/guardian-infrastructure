variable "api_docs_build_context" {
  description = "Path to the build context for the api-docs service."
  default     = "."
}

variable "api_docs_dockerfile" {
  description = "Path to the Dockerfile for the api-docs service."
  default     = "./guardian/api-docs/Dockerfile"
}

variable "api_docs_image" {
  description = "The image name for the api-docs."
  default     = "api-docs"
}

variable "app_network_name" {
  description = "The name of the Docker network to which the api-docs service will be connected."
  default     = "app-network"
}