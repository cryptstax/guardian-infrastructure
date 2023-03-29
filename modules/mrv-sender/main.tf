resource "docker_container" "mrv_sender" {
  image = var.mrv_sender_image
  name  = "mrv-sender"

  ports {
    internal = 3005
    external = 3005
  }
}

