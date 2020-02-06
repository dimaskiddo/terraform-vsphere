module "example_instance" {
  # Source
  source                    = "../modules/vsphere"

  # Vars Server
  server_endpoint           = "vcenter.localhost"
  server_unverified_ssl     = "true"
  
  server_user               = "user"
  server_password           = "password"

  # Vars Provider
  provider_datacenter       = "DC1"
  provider_cluster          = "CL1"
  provider_resource_pool    = "RP1"
  provider_datastore        = "DS1"
  provider_network          = "NT1"

  # Vars Template
  template_guest            = "ubuntu64Guest"
  template_name             = "Ubuntu 16.04"

  # Vars Instance
  instance_name             = "Ubuntu-Virtual-Machine"
  instance_cpu              = "1"
  instance_memory           = "1024"
  instance_disk_size        = "8"
  instance_ipv4_address     = "172.10.13.11"
  instance_ipv4_prefix      = "16"
  instance_ipv4_gateway     = "172.10.0.1"
  instance_dns_server_list  = ["172.10.0.1"]
}
