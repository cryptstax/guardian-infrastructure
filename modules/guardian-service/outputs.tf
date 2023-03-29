output "container_id" {
  value = docker_container.guardian_service.id
}

output "container_name" {
  value = docker_container.guardian_service.name
}