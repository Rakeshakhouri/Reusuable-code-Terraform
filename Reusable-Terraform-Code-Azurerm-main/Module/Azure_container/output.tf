output "container" {
    value = {for k, r in azurerm_storage_container.container : k => r.id }
}