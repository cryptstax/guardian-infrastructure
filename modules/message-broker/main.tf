resource "docker_image" "message_broker" {
  name = var.message_broker_image
}

resource "docker_container" "message_broker" {
  image    = var.message_broker_image
  name     = "message-broker"
  restart  = "always"
  must_run = true

  ports {
    internal = var.message_broker_expose_port
  }

  ports {
    internal = var.message_broker_http_port
    external = var.message_broker_http_port
  }

  command = ["--http_port", var.message_broker_http_port]

  networks_advanced {
    name = var.app_network_name
  }
}

