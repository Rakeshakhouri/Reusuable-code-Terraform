output "storage_account" {
  description = "ids of storage account "
  value       = { for k, s in azurerm_storage_account.storage_account : k => s.id }
}