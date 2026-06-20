resource "azurerm_storage_container" "container" {
  for_each                          = var.container
  name                              = each.value.name
  storage_account_id                = data.azurerm_storage_account.storage[each.key].id
  container_access_type             = each.value.container_access_type

}