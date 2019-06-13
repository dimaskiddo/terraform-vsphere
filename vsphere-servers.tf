# vSphere Server Variables
# -----------------------------------------------------------------
# Variable vSphere Server URL
variable "vsphere_server_endpoint" {
  description = "vsphere server endpoint"
  default     = ""
}

# Variable vSphere Server Unverified SSL
variable "vsphere_server_unverified_ssl" {
  description = "vsphere server unverified ssl"
  default     = true
}
# -----------------------------------------------------------------
