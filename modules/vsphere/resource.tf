resource "vsphere_virtual_machine" "standalone" {
  name                  = "${var.instance_name}"

  num_cpus              = "${var.instance_cpu}"
  memory                = "${var.instance_memory}"

  guest_id              = "${var.template_guest}"

  resource_pool_id      = "${data.vsphere_resource_pool.pool.id}"
  datastore_id          = "${data.vsphere_datastore.datastore.id}"

  scsi_type             = "${data.vsphere_virtual_machine.template.scsi_type}"

  clone {
    template_uuid       = "${data.vsphere_virtual_machine.template.id}"

    customize {
      timeout = "60"
      
      linux_options {
        host_name       = "${var.instance_name}"
        domain          = "${var.instance_name}"
      }

      network_interface {
        ipv4_address    = "${var.instance_ipv4_address}"
        ipv4_netmask    = "${var.instance_ipv4_prefix}"
      }

      ipv4_gateway      = "${var.instance_ipv4_gateway}"
      dns_server_list   = "${var.instance_dns_server_list}"
    }
  }

  disk {
    label               = "disk0"
    size                = "${var.instance_disk_size}"
    eagerly_scrub       = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned    = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  network_interface {
    network_id          = "${data.vsphere_network.network.id}"
    adapter_type        = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
}
