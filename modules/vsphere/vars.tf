variable "server_endpoint" {
  description = "vSphere Server Endpoint"
}

variable "server_unverified_ssl" {
  description = "vSphere Server Has Unverified SSL"
  default     = "true"
}

variable "server_user" {
  description = "vSphere Server User"
}

variable "server_password" {
  description = "vSphere Server Password"
}

variable "provider_datacenter" {
  description = "vSphere Provider Datacenter"
}

variable "provider_cluster" {
  description = "vSphere Provider Cluster"
}

variable "provider_resource_pool" {
  description = "vSphere Provider Resource Pool"
}

variable "provider_datastore" {
  description = "vSphere Provider Datastore"
}

variable "provider_network" {
  description = "vSphere Provider Network"
}

variable "template_guest" {
  description = "vSphere Template Guest"
}

variable "template_name" {
  description = "vSphere Template Name"
}

variable "instance_name" {
  description = "vSphere Instance Name"
}

variable "instance_cpu" {
  description = "vSphere Instance CPU"
  default     = "1"
}

variable "instance_memory" {
  description = "vSphere Instance Memory"
  default     = "1024"
}

variable "instance_disk_size" {
  description = "vSphere Instance Disk Size"
  default     = "8"
}

variable "instance_ipv4_address" {
  description = "vSphere Instance IPv4 Address"
}

variable "instance_ipv4_prefix" {
  description = "vSphere Instance IPv4 Prefix"
}

variable "instance_ipv4_gateway" {
  description = "vSphere Instance IPv4 Gateway"
}
