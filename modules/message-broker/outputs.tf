output "container_id" {
  value = docker_container.message_broker.id
}

output "container_name" {
  value = docker_container.message_broker.name
}
