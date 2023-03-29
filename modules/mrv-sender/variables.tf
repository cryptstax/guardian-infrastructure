variable "mrv_sender_image" {
  description = "Docker image for the mrv-sender service"
  type        = string
}

variable "mrv_sender_build_context" {
  description = "Build context path for the mrv-sender service"
  type        = string
}

variable "mrv_sender_dockerfile" {
  description = "Dockerfile path for the mrv-sender service"
  type        = string
}
