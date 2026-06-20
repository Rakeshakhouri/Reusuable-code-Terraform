data "azurerm_storage_account" "storage" {
  for_each            = var.container
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name

}