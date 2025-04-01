## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# This Terraform script provisions a compute instance


resource "oci_core_instance" "compute_instance" {
  availability_domain = var.availablity_domain_name == "" ? data.oci_identity_availability_domains.ADs.availability_domains[0]["name"] : var.availablity_domain_name
  compartment_id      = var.compartment_ocid
  display_name        = "test-instance"
  shape               = var.instance_shape
  fault_domain        = "FAULT-DOMAIN-1"

  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }

  metadata = {
    "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3jJ6cWKevDjX/qyA2phYRVDlyKO+s0An7aq8UsCC3Xd/XYMkbBFNupQ/JOpvS4VAh25f8joRz3T8mCM33ObmMev+J7IX9Eh2Hl8m2/46lDfoVwKb7HNjcfqhVY6MrzJjueJXKGm69UbCQrsX2gkI/R1AynZ+r1Bgn53+aoin6cQtNzHy31km459EyCittOQhJcNWpF4oP1jlN7+6h4M26BEB+cKctvT1h0beThcG1/HHFTn1nrCAxKE2f3eJzIKXrSoV1x2DfIZqb9jTXb/C0WUPjcW2x/BQQ9wjQm/0BV9mpzsy7rt9HiJrjkaIPDglkchHGuq6X7/M8J3uBos4h ssh-key-2025-03-25"
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.subnet.id
    display_name              = "primaryvnic"
    assign_public_ip          = true
    assign_private_dns_record = true
  }

  source_details {
    source_type             = "image"
    source_id               = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaalkl63v2t2n52u3jgon2i3lsqzf5hecztzgqlasm6djuzgedf2eaa"
    boot_volume_size_in_gbs = "50"
  }

  timeouts {
    create = "60m"
  }
}
