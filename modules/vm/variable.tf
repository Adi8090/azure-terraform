variable "location" {
  description = "Azure region"
}

variable "resourcegroup" {
  description = "Resource Group name"
}

# ✅ Map of VM configs (for_each driver)
variable "vm_config" {
  description = "Map of VM configurations"
}

variable "admin_username" {
  description = "Admin username for VM"
}

variable "admin_password" {
  description = "Admin password for VM"
}

# ✅ NIC map coming from NIC module
variable "nic_ids" {
  description = "Map of NIC IDs indexed by VM key"
}