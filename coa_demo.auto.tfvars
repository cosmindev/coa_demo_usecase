# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#############################
# TENANCY DETAILS
#############################

# default compartment 
default_compartment_id = "ocid1.compartment.oc1..aaaaaaaawwhpzd5kxd7dcd56kiuuxeaa46icb44cnu7osq3mbclo2pnv3dpq"

#############################
# naming convension
#############################

# the prefix that will be used for all the names of the OCI artifacts that this automation will provision
names_prefix = "coa-demo-"

# the defined tags to be used for all the artifacts that this automation will provision
#defined_tags = {}

# the freeform tags to be used for all the artifacts that this automation will provision
#freeform_tags = {}

#############################
# COA network
#############################

# The specific network compartment id. If this is null then the default, project level compartment_id will be used.
network_compartment_id = null

# VCN CIDR
vcn_cidr = "10.0.0.0/16"

# private subnet CIDR
private_subnet_cidr = "10.0.0.0/24"

# private DB subnet CIDR
db_private_subnet_cidr = "10.0.10.0/24"


# public subnet CIDR
public_subnet_cidr = "10.0.20.0/24"

#############################
# OCI COA WEB Instances
#############################

# The specific compute compartment id. If this is null then the default, project level compartment_id will be used.
compute_compartment_id = null

# The number of cluster nodes to be provisioned
cluster_size = 2

# Compute instances ssh public key
ssh_public_key_path = "/Users/cotudor/my_ssh_keys/cos_key.pub"

# Compute instances ssh private key
ssh_private_key_path = "/Users/cotudor/my_ssh_keys/cos_key.openssh"

# The name of the shape to be used for all the provisioned compute instances. The automation will automatically figure out the OCID for the spaecific shape name in the target region.
shape = "VM.Standard1.1"


# The name of the image to be used for all the provisioned compute instances. The automation will automatically figure out the OCID for the specific image name in the target region.
image_name = "Oracle-Linux-8.5-2022.04.04-0"


# Which product to install
# Accepted values: ["Apache", "Nginx", null] 
install_product = "Nginx"

#############################
# OCI COA LBaaS
#############################

# The COA LBaaS Shape
load_balancer_shape = "100Mbps"

# LBaaS listening ports
# Accepted values: ["80", "443", "<port number>"] close
lbaas_listening_ports = ["80", "443"]

# The path to the load balancer route key CA certificate(CA)
# Only used if port SSL:443 is enabled
lb_ca_certificate = "./certs/ca.crt"

# The path to the load balancer private_key
# Only used if port SSL:443 is enabled
lb_private_key = "./certs/loadbalancer.key"

# The path to the load balancer public_certificate
# Only used if port SSL:443 is enabled
lb_public_certificate = "./certs/loadbalancer.crt"