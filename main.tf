terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  alias = "kreuzwerker"
  host  = "unix:///var/run/docker.sock"
}

# resource "docker_network" "app_network" {
#   name = "app_network"
# }

module "api-docs" {
  source = "./modules/api-docs"

  api_docs_image         = "api-docs"
  api_docs_build_context = "."
  api_docs_dockerfile    = "./guardian/api-docs/Dockerfile"
  api_docs_expose_port   = 3001

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "api-gateway" {
  source = "./modules/api-gateway"

  api_gateway_image         = "api-gateway"
  api_gateway_build_context = "."
  api_gateway_dockerfile    = "./guardian/api-gateway/Dockerfile"
  api_gateway_expose_port   = 3002

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }

  # Add the "depends_on" output variables from other modules as inputs
  auth_service_dependency     = module.auth-service.container_name
  guardian_service_dependency = module.guardian-service.container_name
  logger_service_dependency   = module.logger-service.container_name
  message_broker_dependency   = module.message-broker.container_name
  mongo_dependency            = module.mongo.container_name
}

module "auth-service" {
  source = "./modules/auth-service"

  auth_service_image         = "auth-service"
  auth_service_build_context = "."
  auth_service_dockerfile    = "./guardian/auth-service/Dockerfile"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
  # Add the "depends_on" output variables from other modules as inputs
  logger_service_dependency = module.logger-service.container_name
  message_broker_dependency = module.message-broker.container_name
  mongo_dependency          = module.mongo.container_name
  vault_dependency          = module.vault.container_name
}

module "guardian-service" {
  source = "./modules/guardian-service"

  guardian_service_image         = "guardian-service"
  guardian_service_build_context = "."
  guardian_service_dockerfile    = "./guardian/guardian-service/Dockerfile"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
  # Add the "depends_on" output variables from other modules as inputs
  auth_service_dependency     = module.auth-service.container_name
  logger_service_dependency   = module.logger-service.container_name
  message_broker_dependency   = module.message-broker.container_name
  mongo_dependency            = module.mongo.container_name
  policy_service_dependency   = module.policy-service.container_name
  worker_service_1_dependency = module.worker-service-1.container_name
  worker_service_2_dependency = module.worker-service-2.container_name
}

module "ipfs-node" {
  source = "./modules/ipfs-node"

  ipfs_node_image = "ipfs/kubo:v0.18.1"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "logger-service" {
  source = "./modules/logger-service"

  logger_service_image         = "logger-service"
  logger_service_build_context = "."
  logger_service_dockerfile    = "./guardian/logger-service/Dockerfile"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "message-broker" {
  source = "./modules/message-broker"

  message_broker_image = "nats:2.9.8"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "mongo" {
  source = "./modules/mongo"

  mongo_image       = "mongo:6.0.3"
  mongo_command     = "--setParameter allowDiskUseByDefault=true"
  mongo_expose_port = 27017

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "mongo-express" {
  source = "./modules/mongo-express"

  mongo_express_image       = "mongo-express:1.0.0-alpha.4"
  mongo_expose_port         = 27017
  mongo_container_name      = module.mongo.container_name
  mongo_express_expose_port = 8081
  mongo_express_baseurl     = "/mongo-admin"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "mrv-sender" {
  source = "./modules/mrv-sender"

  mrv_sender_image         = "mrv-sender"
  mrv_sender_build_context = "."
  mrv_sender_dockerfile    = "./guardian/mrv-sender/Dockerfile"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "policy-service" {
  source = "./modules/policy-service"

  policy_service_image         = "policy-service"
  policy_service_build_context = "."
  policy_service_dockerfile    = "./guardian/policy-service/Dockerfile"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "topic_viewer" {
  source = "./modules/topic-viewer"

  topic_viewer_image         = "topic-viewer"
  topic_viewer_build_context = "."
  topic_viewer_dockerfile    = "./guardian/topic-viewer/Dockerfile"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "vault" {
  source = "./modules/vault"

  vault_image             = "vault:1.12.2"
  vault_dev_root_token_id = "1234"
  vault_server            = "http://0.0.0.0:8200"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "web-proxy" {
  source = "./modules/web-proxy"

  web_proxy_context    = "."
  web_proxy_dockerfile = "./web-proxy/Dockerfile"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "worker-service-1" {
  source = "./modules/worker-service"

  worker_service_context    = "."
  worker_service_dockerfile = "./guardian/worker-service/Dockerfile"
  service_channel           = "worker.1"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}

module "worker-service-2" {
  source = "./modules/worker-service"

  worker_service_context    = "."
  worker_service_dockerfile = "./guardian/worker-service/Dockerfile"
  service_channel           = "worker.2"

  providers = {
    docker.kreuzwerker = docker.kreuzwerker
  }
}
