variable "api_gateway_image" {
  description = "Docker image for the api-gateway service"
  type        = string
}

variable "api_gateway_build_context" {
  description = "Build context for the api-gateway service"
  type        = string
}

variable "api_gateway_dockerfile" {
  description = "Dockerfile for the api-gateway service"
  type        = string
}

variable "api_gateway_expose_port" {
  description = "Port to expose the api-gateway service"
  type        = number
}
