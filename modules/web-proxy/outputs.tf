output "web_proxy_container_name" {
  value = docker_container.web_proxy.name
}

output "web_proxy_container_id" {
  value = docker_container.web_proxy.id
}