# ipfs-node/main.tf

resource "docker_container" "ipfs_node" {
  image = "ipfs/kubo:v0.18.1"
  name  = "ipfs-node"
  ports {
    internal = 5001
    external = 5001
  }
  ports {
    internal = 5002
    external = 5002
  }
  ports {
    internal = 4001
    external = 4001
  }
  ports {
    internal = 4002
    external = 4002
  }
  ports {
    internal = 8080
    external = 8080
  }
  ports {
    internal = 8081
    external = 8081
  }
  volumes {
    container_path = "/export"
    host_path      = var.ipfs_staging_volume
    read_only      = false
  }
  volumes {
    container_path = "/data/ipfs"
    host_path      = var.ipfs_data_volume
    read_only      = false
  }
  networks_advanced {
    name = var.app_network_name
  }
}