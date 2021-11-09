## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "region" {}
variable "fingerprint" {}
variable "user_ocid" {}
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "private_key_path" {}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "hub-spoke" {
  #source                           = "github.com/oracle-devrel/terraform-oci-arch-hub-spoke"
  source                           = "../../"
  tenancy_ocid                     = var.tenancy_ocid
  user_ocid                        = var.user_ocid
  fingerprint                      = var.fingerprint
  region                           = var.region
  private_key_path                 = var.private_key_path
  compartment_ocid                 = var.compartment_ocid
  deploy_bastion_instance          = false # no bastion host in HUB VCN
  hub_vcn_cidr_block               = "192.168.0.0/16"
  hub_subnet_pub01_cidr_block      = "192.168.1.0/24"
  deploy_spoke01_instance          = false # no machine in spoke01 VCN
  spoke01_vcn_cidr_block           = "10.10.0.0/16"
  spoke01_subnet_priv01_cidr_block = "10.10.0.0/24"
  deploy_spoke02_instance          = false # no machine in spoke02 VCN
  spoke02_vcn_cidr_block           = "172.16.0.0/16"
  spoke02_subnet_priv01_cidr_block = "172.16.1.0/24"
}

output "vcn_id_hub_id" {
  value = module.hub-spoke.vcn_id_hub_id
}
output "vcn_id_spoke01_id" {
  value = module.hub-spoke.vcn_id_spoke01_id
}

output "vcn_id_spoke02_id" {
  value = module.hub-spoke.vcn_id_spoke02_id
}
