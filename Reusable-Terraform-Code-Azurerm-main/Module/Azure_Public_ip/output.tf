output "pip" {
  value = { for k, q in azurerm_public_ip.pip : k => q.id }
}
