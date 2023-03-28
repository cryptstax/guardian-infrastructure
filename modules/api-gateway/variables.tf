variable "api_gateway_build_context" {
  description = "The build context for the api-gateway."
  default     = "."
}

variable "api_gateway_dockerfile" {
  description = "The Dockerfile for the api-gateway."
  default     = "./guardian/api-gateway/Dockerfile"
}

variable "api_gateway_image" {
  description = "The image name for the api-gateway."
  default     = "api-gateway"
}

variable "api_gateway_exposed_port" {
  description = "The exposed port for the api-gateway."
  default     = 3002
}

variable "app_network_name" {
  description = "The name of the app network."
  default     = "app-network"
}