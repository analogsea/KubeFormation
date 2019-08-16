variable "openstack_compute_flavor_id" {
    description = "Unique to tenant."
    default = ""
}

variable "openstack_image_id" {
    description = "Unique to tenant."
    default = ""
}

variable "boot_drive_size" {
    description = "Size of boot drive in GB"
    default = 25
}

variable "node_storage_size" {
    description = "Size of attached block storage on workers in GB"
    default = 500
}

variable "num_worker_nodes" {
    description = "Number of Kubernetes worker nodes"
    default = 3
}

variable "openstack_keypair" {
    description = "OpenStack keypair name. Unique to tenant."
    default = ""
}

variable "tenant_network" {
    description = "OpenStack network name. Unique to tenant."
    default = ""
}
