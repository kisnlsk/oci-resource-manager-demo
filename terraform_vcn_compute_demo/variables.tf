## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "region" {}
variable "ssh_public_key" {
  default = ""
}
variable "compartment_ocid" {
}

variable "availablity_domain_name" {
  default = ""
}
variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "Subnet-CIDR" {
  default = "10.0.1.0/24"
}

variable "instance_shape" {
  description = "Instance Shape"
  default     = "VM.Standard.E3.Flex"
}

variable "instance_ocpus" {
  default = 1
}

variable "instance_shape_config_memory_in_gbs" {
  default = 1
}

variable oci_core_instance--source_details-source_id--export_test-instance { default = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaay72qyswcworlh5phdr67q7aezs2ecmhbrs2yqs7x6iudtxw22qta" }
variable availability_domain--nNMJ-AP-TOKYO-1-AD-1 { default = "nNMJ:AP-TOKYO-1-AD-1" }
variable fault_domain--FAULT-DOMAIN-3 { default = "FAULT-DOMAIN-3" }
