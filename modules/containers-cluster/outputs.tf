output container_names {
  value = docker_container.container[*].name
  description = "Container names"
}

output container_ids {
  value = docker_container.container[*].id
  description = "Container ids"
}