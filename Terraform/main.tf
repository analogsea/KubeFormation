resource "openstack_blockstorage_volume_v3" "node-storage" {
  count =  "${var.num_worker_nodes}"
  name        = "node-storage-${count.index+1}"
  description = "Node storage"
  size        = "${var.node_storage_size}"
}

resource "openstack_compute_instance_v2" "kube-master" {
  name = "kube-master-${count.index+1}"
  flavor_id       = "${var.openstack_compute_flavor_id}"
  key_pair        = "${var.openstack_keypair}"

  count = 1

  block_device {
    uuid                  = "${var.openstack_image_id}"
    source_type           = "image"
    volume_size           = "${var.boot_drive_size}"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    name = "${var.tenant_network}"
  }
}

resource "openstack_compute_instance_v2" "kube-node" {
  name = "kube-node-${count.index+1}"
  flavor_id       = "${var.openstack_compute_flavor_id}"
  key_pair        = "${var.openstack_keypair}"
  count = "${var.num_worker_nodes}"

  block_device {
    uuid                  = "${var.openstack_image_id}"
    source_type           = "image"
    volume_size           = "${var.boot_drive_size}"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    name = "${var.tenant_network}"
  }
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  count =  "${var.num_worker_nodes}"
  instance_id = "${openstack_compute_instance_v2.kube-node[count.index].id}"
  volume_id   = "${openstack_blockstorage_volume_v3.node-storage[count.index].id}"
}

output "master-ip" {
  value = "${openstack_compute_instance_v2.kube-master.*.access_ip_v4}"
}

output "node-ip" {
  value = ["${openstack_compute_instance_v2.kube-node.*.access_ip_v4}"]
}

// resource "openstack_compute_floatingip_associate_v2" "assign" {
//   count = 3
//   floating_ip = "${openstack_networking_floatingip_v2.floatip[count.index].address}"
//   instance_id = "${openstack_compute_instance_v2.clement-test[count.index].id}"
// }
