provider "docker" {}

resource "docker_network" "app_network" {
  name = "app_network"
}

module "mongo" {
  source = "./modules/mongo"
}

module "mongo_express" {
  source = "./modules/mongo-express"

  depends_on = [
    module.mongo
  ]
}

module "ipfs_node" {
  source = "./modules/ipfs-node"

  app_network_name    = var.docker_network.app.name
  ipfs_staging_volume = "your_staging_volume_path"
  ipfs_data_volume    = "your_data_volume_path"
}

module "api_docs" {
  source = "./modules/api-docs"

  app_network_name       = var.docker_network.app_network.name
  api_docs_build_context = "."                    # assuming the build context is the root folder
  api_docs_dockerfile    = "./guardian/api-docs/Dockerfile" # assuming the Dockerfile is in the api-docs folder
}

module "message_broker" {
  source = "./modules/message-broker"

  app_network_name           = docker_network.app.name
  message_broker_image       = "nats:2.9.8"
  message_broker_http_port   = "8222"
  message_broker_expose_port = "4222"
}

module "vault" {
  source = "./modules/vault"

}

module "logger_service" {
  source = "./modules/logger-service"

  depends_on = [
    module.message-broker
  ]
}

module "worker_service_1" {
  source = "./modules/worker-service"

  depends_on = [
    module.ipfs-node,
    module.auth-service
  ]

  environment = {
    SERVICE_CHANNEL = "worker.1"
  }
}

module "worker_service_2" {
  source = "./modules/worker-service"

  depends_on = [
    module.ipfs-node,
    module.auth-service
  ]
  environment = {
    SERVICE_CHANNEL = "worker.2"
  }
}

module "auth_service" {
  source = "./modules/auth-service"

  depends_on = [
    module.mongo,
    module.vault,
    module.message-broker,
    module.logger-service
  ]
}

module "api_gateway" {
  source = "./modules/api-gateway"

  depends_on = [
    module.mongo,
    module.message-broker,
    module.guardian-service,
    module.auth-service,
    module.logger-service
  ]
}

module "policy_service" {
  source = "./modules/policy-service"
  depends_on = [
    module.mongo,
    module.message-broker,
    module.auth-service,
    module.logger-service
  ]
}

module "guardian_service" {
  source = "./modules/guardian-service"

  depends_on = [
    module.mongo,
    module.message-broker,
    module.auth-service,
    module.logger-service,
    module.worker-service-1,
    module.worker-service-2,
    module.policy-service
  ]
}

module "mrv_sender" {
  source = "./modules/mrv-sender"
}

module "topic_viewer" {
  source = "./modules/topic-viewer"

  topic_viewer_image         = "topic-viewer-image:latest"
  topic_viewer_build_context = "./path/to/build/context"
}

module "web_proxy" {
  source = "./modules/web-proxy"

  depends_on = [
    module.guardian-service,
    module.auth-service,
    module.api-gateway,
    module.api-docs,
    module.mrv-sender,
    module.mongo-express
  ]

  web_proxy_image         = "your_web_proxy_image"
  web_proxy_build_context = "your_web_proxy_build_context"
  web_proxy_port          = "your_web_proxy_port"
}