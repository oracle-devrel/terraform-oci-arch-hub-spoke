## Deploy arch-hub-spoke module with hosts
This is an example of how to use the arch-hub-spoke module to deploy as the remote module with hosts.
  
### Using this example
Update terraform.tfvars with the required information.

### Deploy the module
Initialize Terraform:
```
$ terraform init
```
View what Terraform plans do before actually doing it:
```
$ terraform plan
```

Create a `terraform.tfvars` file, and specify the following variables:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
user_ocid            = "<user_ocid>"
fingerprint          = "<finger_print>"
private_key_path     = "<pem_private_key_path>"

# Region
region = "<oci_region>"

# Compartment
compartment_ocid = "<compartment_ocid>"
```

Use Terraform to Provision resources:
```
$ terraform apply -auto-approve
```

### Destroy the Tomcat 

Use Terraform to destroy resources:
```
$ terraform destroy -auto-approve
```