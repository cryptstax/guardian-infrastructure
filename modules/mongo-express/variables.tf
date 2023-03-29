variable "mongo_express_image" {
  description = "Docker image for the mongo-express service"
  type        = string
}

variable "mongo_expose_port" {
  description = "Port to expose the mongo service"
  type        = number
}

variable "mongo_container_name" {
  description = "Name of the mongo container"
  type        = string
}

variable "mongo_express_expose_port" {
  description = "Port to expose the mongo-express service"
  type        = number
}

variable "mongo_express_baseurl" {
  description = "Base URL for the mongo-express service"
  type        = string
}
