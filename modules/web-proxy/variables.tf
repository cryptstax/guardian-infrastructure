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
