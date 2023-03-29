output "container_id" {
  value = docker_container.mongo.id
}

output "container_name" {
  value = docker_container.mongo.name
}