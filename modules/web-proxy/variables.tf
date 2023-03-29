variable "web_proxy_image" {
  type        = string
  description = "Docker image for the web proxy service"
}

variable "web_proxy_build_context" {
  type        = string
  description = "Build context for the web proxy service"
}

variable "web_proxy_port" {
  type        = string
  description = "Port for the web proxy service"
}