variable "keyvault" {
  type = map(object({
    name                        = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    location                    = string
    purge_protection_enabled    = bool
    soft_delete_retention_days  = number
    sku_name                    = string
  }))
}
