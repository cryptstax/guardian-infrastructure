variable "api_docs_image" {
  description = "Docker image for the api-docs service"
  type        = string
}

variable "api_docs_build_context" {
  description = "Build context for the api-docs service"
  type        = string
}

variable "api_docs_dockerfile" {
  description = "Dockerfile for the api-docs service"
  type        = string
}

variable "api_docs_expose_port" {
  description = "Port to expose the api-docs service"
  type        = number
}
