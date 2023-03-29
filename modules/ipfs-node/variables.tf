variable "docker_volumes" {
  description = "Docker volumes for services"
  type = list(object({
    service_name   = string
    host_path      = string
    container_path = string
    access_mode    = string
  }))
  default = [
    {
      service_name   = "ipfs-node"
      host_path      = "./runtime-data/ipfs/data"
      container_path = "/data/ipfs"
      access_mode    = "rw"
    },
    {
      service_name   = "ipfs-node"
      host_path      = "./runtime-data/ipfs/staging"
      container_path = "/export"
      access_mode    = "rw"
    }
  ]
}

variable "ipfs_node_image" {
  description = "Docker image for the ipfs-node service"
  type        = string
}
