# Required variables doesn't have a default value
variable "container_image" {
  # type = string is the default
  description = "Image to create conteiners based on it"
}

variable "container_count" {
  type = number
  default = 1
  description = "Number of containers to run"
}

# Complex type example
variable labels {
  type = list(object({
    label = string
    value = string
  }))
  default = []
  description = "https://www.terraform.io/docs/providers/docker/r/container.html#labels-1"
}
