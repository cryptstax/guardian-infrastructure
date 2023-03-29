output "container_id" {
  value = docker_container.logger_service.id
}

output "container_name" {
  value = docker_container.logger_service.name
}
