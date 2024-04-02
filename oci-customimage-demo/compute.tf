## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# This Terraform script provisions a compute instance


resource "oci_core_instance" "compute_instance" {
  availability_domain = var.availablity_domain_name == "" ? data.oci_identity_availability_domains.ADs.availability_domains[0]["name"] : var.availablity_domain_name
  compartment_id      = var.compartment_ocid
  display_name        = "Demo_01"
  shape               = var.instance_shape
  fault_domain        = "FAULT-DOMAIN-1"

  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  metadata = {
    "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUxHiL8bvle2sWkZgqwJ9bdhqTFNpx/6wkfUdg+jCUzIY0d+c0jy5/I3PkqsfTuUipMw0y3nWIo2XwPPeHJaKEY8HaORp1GY6XCg8Gee75RfH4kCUxGheSLQd/K9dy3g352FTauugW/L4DIQv/w5Dy6/By1QiVG2O0uGGorssDTj93dbOUuplwp5FPWByu0meEZnLeOZ+bOhdcohAp/YZbiWGzaynerOsSQbukKQTdKtzgBMwFh/L7Np12L2K+dv6XEeDJ4GGSJEBO3Nwdwhiue5G6v5RGzVS74ZuA2kPxe/Dg/MMulmeuZ+8tdWs0Y9k1g/48w6hGrPYwl3Tt8Vw5 ssh-key-2024-03-31"
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.subnet.id
    display_name              = "primaryvnic"
    assign_public_ip          = true
    assign_private_dns_record = true
  }

  source_details {
    source_type             = "image"
    source_id               = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaap46pyugwk22he4q2nrjclz4vlemnb46rdjewk6lzbl7oixngvc3a"
    boot_volume_size_in_gbs = "50"
  }

  timeouts {
    create = "60m"
  }
}
