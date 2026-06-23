module "network" {
  source = "./modules/network"

  location      = var.location
  resourcegroup = var.resourcegroup
}

module "nsg" {
  source = "./modules/nsg"

  location      = var.location
  resourcegroup = var.resourcegroup
  subnet_id     = module.network.subnet_id
}

# ✅ NIC now uses vm_config (for_each)
module "nic" {
  source = "./modules/nic"

  location      = var.location
  resourcegroup = var.resourcegroup
  subnet_id     = module.network.subnet_id

  vm_config = var.vm_config
}

# ✅ VM maps NIC properly using keys
module "vm" {
  source = "./modules/vm"

  location       = var.location
  resourcegroup  = var.resourcegroup
  vm_config      = var.vm_config
  admin_username = var.admin_username
  admin_password = var.admin_password

  nic_ids = module.nic.nic_ids
}

# ✅ Function App
#module "function_app" {
#  source = "./modules/function_app"
#
#  location      = var.location
#  resourcegroup = var.resourcegroup
#}

# ✅ OpenAI
#module "openai" {
#  source = "./modules/openai"
#
#  location      = var.location
#  resourcegroup = var.resourcegroup
#}