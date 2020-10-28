resource "docker_image" "image" {
  name = var.container_image
}

resource "random_string" "random" {
  count = var.container_count
  length = 5
  special = false
}

resource "random_shuffle" "name" {
  input = ["john", "doe", "mary", "beaver", "einstein"]
  result_count = var.container_count
}

resource "docker_container" "container" {
  count = var.container_count
  image = docker_image.image.name
  name = "${random_shuffle.name.result[count.index]}-${random_string.random[count.index].result}"

  dynamic "labels" {
    for_each = var.labels
    content {
      label = labels.label
      value = labels.value
    }
  }
}
