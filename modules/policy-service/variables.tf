variable "policy_service_build_context" {
  description = "The build context for the policy-service."
  default     = "."
}

variable "policy_service_dockerfile" {
  description = "The Dockerfile for the policy-service."
  default     = "./guardian/policy-service/Dockerfile"
}

variable "policy_service_image" {
  description = "The image name for the policy-service."
  default     = "policy-service"
}

variable "app_network_name" {
  description = "The name of the app network."
  default     = "app-network"
}