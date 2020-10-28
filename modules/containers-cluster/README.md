## Requirements

| Name | Version |
|------|---------|
| docker | ~> 2.7 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| container\_count | Number of containers to run | `number` | `1` | no |
| container\_image | Image to create conteiners based on it | `any` | n/a | yes |
| labels | https://www.terraform.io/docs/providers/docker/r/container.html#labels-1 | <pre>list(object({<br>    label = string<br>    value = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| container\_ids | Container ids |
| container\_names | Container names |

