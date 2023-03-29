# ipfs-node/variables.tf

variable "app_network_name" {
  type        = string
  description = "The name of the Docker network to which the IPFS node should be connected"
}

variable "ipfs_staging_volume" {
  type        = string
  description = "The Docker volume for the IPFS staging directory"
}

variable "ipfs_data_volume" {
  type        = string
  description = "The Docker volume for the IPFS data directory"
}