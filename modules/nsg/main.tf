resource "azurerm_network_security_group" "rg" {
  name                = "rg-nsg"
  location            = var.location
  resource_group_name = var.resourcegroup
}

# ✅ SSH Rule (Safe priority range)
resource "azurerm_network_security_rule" "ssh" {
  name                        = "Allow-SSH"
  priority                    = 300   # ✅ moved to safe range
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resourcegroup
  network_security_group_name = azurerm_network_security_group.rg.name
}

# ✅ HTTP Rule (Safe range + spacing)
resource "azurerm_network_security_rule" "http" {
  name                        = "Allow-HTTP"
  priority                    = 310   # ✅ no overlap ever
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resourcegroup
  network_security_group_name = azurerm_network_security_group.rg.name
}

# ✅ Optional HTTPS (Recommended)
resource "azurerm_network_security_rule" "https" {
  name                        = "Allow-HTTPS"
  priority                    = 320
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resourcegroup
  network_security_group_name = azurerm_network_security_group.rg.name
}

# ✅ Attach NSG to subnet
resource "azurerm_subnet_network_security_group_association" "rg" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.rg.id
}