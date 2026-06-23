# ✅ Storage Account (required)
resource "azurerm_storage_account" "rg" {
  name                     = "rgfuncstorage${random_string.suffix.result}"
  resource_group_name      = var.resourcegroup
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# ✅ Random suffix (to avoid name conflicts)
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# ✅ App Service Plan (Consumption-based)
resource "azurerm_service_plan" "rg" {
  name                = "rg-func-plan"
  location            = var.location
  resource_group_name = var.resourcegroup
  os_type             = "Linux"
  sku_name            = "Y1"
}

# ✅ Function App
resource "azurerm_linux_function_app" "rg" {
  name                       = "rg-function-app-${random_string.suffix.result}"
  location                   = var.location
  resource_group_name        = var.resourcegroup
  service_plan_id            = azurerm_service_plan.rg.id
  storage_account_name       = azurerm_storage_account.rg.name
  storage_account_access_key = azurerm_storage_account.rg.primary_access_key

  site_config {
    application_stack {
      python_version = "3.10"
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "python"
  }
}

