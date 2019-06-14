data "vsphere_datacenter" "dc" {
  name                  = "${var.provider_datacenter}"
}

data "vsphere_compute_cluster" "cluster" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.provider_cluster}"
}

data "vsphere_resource_pool" "pool" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.provider_resource_pool}"
}

data "vsphere_datastore" "datastore" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.provider_datastore}"
}

data "vsphere_network" "network" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.provider_network}"
}

data "vsphere_virtual_machine" "template" {
  datacenter_id         = "${data.vsphere_datacenter.dc.id}"
  name                  = "${var.template_name}"
}
