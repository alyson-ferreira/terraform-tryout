Terraform Try Out
=================

DESCRIPTION
-----------

Just a demonstration of terraform

TRYING OUT
----------

```sh
# 1. Start context
terraform init

# 2. Take a look at the source code

# 3. Apply the fmt command
terraform fmt -recursive

# 4. Take a look at the source code again

# 5. Validate the source code
terraform validate

# 6. Check the plan provisioned in source code
terraform plan

# 7. Check the plan using var argument
terraform plan -var 'labels_nginx={key="value",otherkey="othervalue"}'

# 8. Check the plan using -var-file argument
terraform plan -var-file variables.tfvars

# 9. Check the plan using TF_VAR_* environment variables
export TF_VAR_labels_nginx='{value="from_env",otherkey="othervalue"}' 
terraform plan
unset TF_VAR_labels_nginx

# 10. Apply only the data
terraform apply -target='data.docker_registry_image.nginx'

# 11. Apply all
terraform apply

# TODO. State commands
terraform state help

# Last. Destroy all
terraform destroy
```
