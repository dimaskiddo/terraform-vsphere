provider "vsphere" {
  vsphere_server        = "${var.vsphere_server_endpoint}"
  allow_unverified_ssl  = "${var.vsphere_server_unverified_ssl}"

  user                  = "${var.vsphere_credential_user}"
  password              = "${var.vsphere_credential_password}"
}

data "vsphere_datacenter" "dc" {
  name                  = "${var.vsphere_config_datacenter}"
}

data "vsphere_compute_cluster" "cluster" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.vsphere_config_cluster}"
}

data "vsphere_resource_pool" "pool" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.vsphere_config_resource_pool}"
}

data "vsphere_datastore" "datastore" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.vsphere_config_datastore}"
}

data "vsphere_network" "network" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.vsphere_config_network}"
}

data "vsphere_virtual_machine" "template" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.vsphere_template_name}"
}

resource "vsphere_virtual_machine" "vm" {
  name                  = "${var.vsphere_vm_name}"

  num_cpus              = "${var.vsphere_vm_compute_cpu}"
  memory                = "${var.vsphere_vm_compute_memory}"

  guest_id              = "${var.vsphere_template_guest}"
  resource_pool_id      = "${data.vsphere_resource_pool.pool.id}"
  datastore_id          = "${data.vsphere_datastore.datastore.id}"

  clone {
    template_uuid       = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name       = "${var.vsphere_vm_name}"
        domain          = "${var.vsphere_vm_name}"
      }

      network_interface {
        ipv4_address    = "${var.vsphere_vm_ipv4_address}"
        ipv4_netmask    = "${var.vsphere_vm_ipv4_subnet}"
      }

      ipv4_gateway      = "${var.vsphere_vm_ipv4_gateway}"
    }
  }

  disk {
    label               = "disk0"
    size                = "${var.vsphere_vm_disk_size}"
    eagerly_scrub       = true
    thin_provisioned    = false
  }

  network_interface {
    network_id          = "${data.vsphere_network.network.id}"
  }
}
