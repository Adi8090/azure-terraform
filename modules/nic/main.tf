
resource "azurerm_public_ip" "rg" {
  for_each            = var.vm_config
  name                = "rg-public-ip-${each.key}"
  location            = var.location
  resource_group_name = var.resourcegroup

  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_network_interface" "rg" {
  for_each            = var.vm_config
  name                = "AZ-VM-00-NIC-${each.key}"
  location            = var.location
  resource_group_name = var.resourcegroup

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rg[each.key].id
  }
}