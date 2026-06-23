resource "azurerm_cognitive_account" "openai" {
  name                = "rg-openai-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resourcegroup

  kind     = "OpenAI"
  sku_name = "S0"

  custom_subdomain_name = "rg-openai-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}