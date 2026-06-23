output "vm_names" {
  value = {
    for k, v in azurerm_linux_virtual_machine.rg : k => v.name
  }
}

