variable "container" {
  type = map(object({
    name                  = string
    storage_account_name  = string
    resource_group_name   = string
    container_access_type = optional(string)


  }))
}