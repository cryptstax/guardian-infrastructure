resource "docker_image" "topic_viewer" {
  name = var.topic_viewer_image
  build {
    context = var.topic_viewer_build_context
  }
}

resource "docker_container" "topic_viewer" {
  image = docker_image.topic_viewer.latest
  name  = "topic-viewer"

  ports {
    internal = 3006
    external = 3006
  }
}