output "container_id" {
  value = docker_container.worker_service.id
}

output "container_name" {
  value = docker_container.worker_service.name
}

