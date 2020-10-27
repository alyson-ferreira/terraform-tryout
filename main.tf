terraform {
  required_providers {
    # Lock major version, and restrict minor to be equal or above 7
    docker = "~> 2.7"
  }
}

# This can be passed using CLI with -var or -var-file=<TFVARS_FILE>
variable "labels_nginx" {
  type    = map
  default = {}
}

locals {
  # Local variables can be used just to modify data before using it
  labels_nginx_adapted = [
    for key, val in var.labels_nginx : {
      label = key,
      value = val
    }
  ]
}

# Query data in docker registry, search by name
data "docker_registry_image" "nginx" {
  name = "nginx:alpine"
}

module "ngix_cluster" {
  # Local source
  source          = "./modules/containers-cluster"
  container_count = 2
  container_image = data.docker_registry_image.nginx.name
  labels          = local.labels_nginx_adapted
}

module "httpd_cluster" {
  # Points to the same module as module.nginx_cluster, but fetches from Github
  # source          = "git@github.com/alyson-ferreira/modules/containers-cluster?ref=master"
  # Remote source
  source          = "./modules/containers-cluster"
  container_count = 3
  container_image = "httpd:alpine"
}

# Show the attribute populated after apply, when the data is queried
output "nginx_image_sha256" {
  value = data.docker_registry_image.nginx.sha256_digest
}

# Output the container names aquired by the modules outputs
output "container_names" {
  value = concat(
    module.ngix_cluster.container_names,
    module.httpd_cluster.container_names
  )
}
