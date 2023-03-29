docker_ports = [
  {
    service_name   = "api-docs"
    host_port      = 3001
    container_port = 3001
  },
  {
    service_name   = "api-gateway"
    host_port      = 3002
    container_port = 3002
  },
  {
    service_name   = "ipfs-node"
    host_port      = [5001, 5002, 4001, 4002, 8080, 8081]
    container_port = [5001, 5002, 4001, 4002, 8080, 8081]
  },
  {
    service_name   = "message-broker"
    host_port      = [4222, 8222]
    container_port = [4222, 8222]
  },
  {
    service_name   = "mongo"
    host_port      = 27017
    container_port = 27017
  },
  {
    service_name   = "mongo-express"
    host_port      = 8081
    container_port = 8081
  },
  {
    service_name   = "mrv-sender"
    host_port      = 3005
    container_port = 3005
  },
  {
    service_name   = "topic-viewer"
    host_port      = 3006
    container_port = 3006
  },
  {
    service_name   = "vault"
    host_port      = 8200
    container_port = 8200
  },
  {
    service_name   = "web-proxy"
    host_port      = 3000
    container_port = 80
  }
]

docker_environment = {
  mongo_express = {
    ME_CONFIG_MONGODB_SERVER = "mongo",
    ME_CONFIG_MONGODB_PORT   = 27017,
    ME_CONFIG_SITE_BASEURL   = "/mongo-admin"
  }
  vault = {
    VAULT_SERVER            = "http://0.0.0.0:8200"
    VAULT_DEV_ROOT_TOKEN_ID = "1234"
  },
  worker_service_1 = {
    SERVICE_CHANNEL = "worker.1"
  },
  worker_service_2 = {
    SERVICE_CHANNEL = "worker.2"
  }
}

docker_volumes = [
  {
    service_name   = "ipfs-node"
    host_path      = "./runtime-data/ipfs/staging"
    container_path = "/export"
    access_mode    = "rw"
  },
  {
    service_name   = "ipfs-node"
    host_path      = "./runtime-data/ipfs/data"
    container_path = "/data/ipfs"
    access_mode    = "rw"
  },
  {
    service_name   = "vault"
    host_path      = "./file"
    container_path = "/vault/file"
    access_mode    = "rw"
  },
  {
    service_name   = "vault"
    host_path      = "./config"
    container_path = "/vault/config"
    access_mode    = "rw"
  }
]
