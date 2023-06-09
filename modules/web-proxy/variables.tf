variable "web_proxy_image" {
  type        = string
  description = "The Docker image for the web-proxy service."
  default     = "web-proxy"
}

variable "web_proxy_context" {
  type        = string
  description = "The build context for the web-proxy service."
}

variable "web_proxy_dockerfile" {
  type        = string
  description = "The Dockerfile for the web-proxy service."
}

variable "web_proxy_internal_port" {
  type        = number
  description = "The internal port for the web-proxy service."
  default     = 80
}

variable "web_proxy_external_port" {
  type        = number
  description = "The external port for the web-proxy service."
  default     = 3000
}

variable "api_docs_dependency" {
  description = "This depends_on the container for the api-docs service"
  type        = string
}

variable "api_gateway_dependency" {
  description = "This depends_on the container for the api-gateway service"
  type        = string
}

variable "auth_service_dependency" {
  description = "This depends_on the container for the auth-service"
  type        = string
}

variable "guardian_service_dependency" {
  description = "This depends_on the container for the guardian-service"
  type        = string
}

variable "mongo-express_dependency" {
  description = "This depends_on the container for the mongo-express service"
  type        = string
}

variable "mrv-sender_dependency" {
  description = "This depends_on the container for the mrv-sender service"
  type        = string
}