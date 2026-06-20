output "nsg_ids" {
  value = { for k, y in azurerm_network_security_group.nsg : k => y.id }
}
