output "container_id" {
  value = docker_container.auth_service.id
}

output "container_name" {
  value = docker_container.auth_service.name
}
