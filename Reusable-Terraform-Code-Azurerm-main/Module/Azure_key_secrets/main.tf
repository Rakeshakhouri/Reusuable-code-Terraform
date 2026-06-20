
resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.secrets
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.keyid[each.key].id
  
   depends_on = [
    null_resource.purge_deleted_secrets
  ]
}
