# guardian-infrastructure
An open source Terraform managed deployment of Hedera Guardian services

## Project Structure
```terminal
.
├── guardian
└── modules
    ├── api-docs
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── api-gateway
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── auth-service
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── guardian-service
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── ipfs-node
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── logger-service
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── message-broker
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── mongo
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── mongo-express
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── policy-service
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── vault
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── web-proxy
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── worker-service
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    ├── mrv-sender
    │   ├── main.tf
    ├   ├── outputs.tf
    │   ├── variables.tf
    └── topic-viewer
        ├── main.tf
        ├── variables.tf
.gitignore
.gitmodules
LICENSE
main.tf
README.md
variables.tf
```
