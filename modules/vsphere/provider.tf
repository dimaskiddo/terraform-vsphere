provider "vsphere" {
  vsphere_server        = "${var.server_endpoint}"
  allow_unverified_ssl  = "${var.server_unverified_ssl}"

  user                  = "${var.server_user}"
  password              = "${var.server_password}"
}
