# mongo-express/main.tf

variable "ME_CONFIG_MONGODB_SERVER" {
  type    = string
  default = "mongo"
}

variable "ME_CONFIG_MONGODB_PORT" {
  type    = string
  default = "27017"
}

variable "ME_CONFIG_SITE_BASEURL" {
  type    = string
  default = "/mongo-admin"
}

resource "docker_container" "mongo_express" {
  image  = "mongo-express:1.0.0-alpha.4"
  name   = "mongo-express"
  expose = [8081]
  environment = {
    ME_CONFIG_MONGODB_SERVER = var.ME_CONFIG_MONGODB_SERVER
    ME_CONFIG_MONGODB_PORT   = var.ME_CONFIG_MONGODB_PORT
    ME_CONFIG_SITE_BASEURL   = var.ME_CONFIG_SITE_BASEURL
  }
  networks_advanced {
    name = var.app_network_name
  }
  depends_on = [var.mongo_container_id]
}