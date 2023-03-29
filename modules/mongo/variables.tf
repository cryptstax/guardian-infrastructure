variable "mongo_image" {
  description = "Docker image for the mongo service"
  type        = string
}

variable "mongo_expose_port" {
  description = "Port to expose the mongo service"
  type        = number
}
