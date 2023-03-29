resource "docker_container" "mongo" {
  image   = "mongo:6.0.3"
  name    = "mongo"
  restart = "always"
  expose  = [27017]
  command = ["--setParameter", "allowDiskUseByDefault=true"]
  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_volume" "mongo_data" {
  name = "mongo_data"
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
    name = docker_network.app_network.name
  }
  depends_on = [docker_container.mongo]
}