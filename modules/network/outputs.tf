output "subnet_id" {
  value = azurerm_subnet.rg.id
}

output "vnet_name" {
  value = azurerm_virtual_network.rg.name
}
