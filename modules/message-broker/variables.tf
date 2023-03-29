variable "app_network_name" {
  description = "The name of the Docker network to connect the message-broker service."
  type        = string
}

variable "message_broker_image" {
  description = "The Docker image for the message-broker service."
  type        = string
  default     = "nats:2.9.8"
}

variable "message_broker_http_port" {
  description = "The HTTP port for the message-broker service."
  type        = string
  default     = "8222"
}

variable "message_broker_expose_port" {
  description = "The port to be exposed by the message-broker service."
  type        = string
  default     = "4222"
}