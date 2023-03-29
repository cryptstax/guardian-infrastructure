variable "policy_service_image" {
  description = "Docker image for the policy-service"
  type        = string
}

variable "policy_service_build_context" {
  description = "Build context path for the policy-service"
  type        = string
}

variable "policy_service_dockerfile" {
  description = "Dockerfile path for the policy-service"
  type        = string
}
