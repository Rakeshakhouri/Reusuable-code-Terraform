output "inc_ids" {
  value = {for k, z in azurerm_key_vault.key_vault : k => z.id }
}