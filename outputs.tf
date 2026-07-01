output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "nsg_id" {
  value = module.nsg.nsg_id
}

output "public_ips" {
  value = module.nic.public_ips
}

output "vm_names" {
  value = module.vm.vm_names
}

output "function_app_name" {
  value = module.function_app.function_app_name
}
