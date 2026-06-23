output "nic_ids" {
  value = {
    for k, v in azurerm_network_interface.rg : k => v.id
  }
}

output "public_ips" {
  value = {
    for k, v in azurerm_public_ip.rg : k => v.ip_address
  }
}