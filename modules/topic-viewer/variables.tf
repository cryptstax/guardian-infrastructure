variable "topic_viewer_image" {
  type        = string
  description = "Docker image for the topic-viewer"
}

variable "topic_viewer_build_context" {
  type        = string
  description = "Docker build context for the topic-viewer"
}

variable "topic_viewer_dockerfile" {
  description = "Dockerfile path for the topic-viewer"
  type        = string
}