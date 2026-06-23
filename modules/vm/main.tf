resource "azurerm_linux_virtual_machine" "rg" {
  for_each            = var.vm_config
  name                = "AZ-VM-00-${each.key}"
  resource_group_name = var.resourcegroup
  location            = var.location

  size = each.value.size

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    var.nic_ids[each.key]
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"       # Gen2 image; use "server-gen1" if your VM size needs Gen1
    version   = "latest"
   }

   
lifecycle {
  ignore_changes = [
    identity
  ]
}

}
