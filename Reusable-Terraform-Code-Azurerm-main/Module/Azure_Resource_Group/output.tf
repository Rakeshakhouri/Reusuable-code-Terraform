output "Rg-ids" {
  # value = { for key, value in azurerm_resource_group.resource_group : key => value.id }
  #  value = { for key, value in azurerm_resource_group.resource_group : key => {id:value.id name:value.name}}  2 things diplay
  value = azurerm_resource_group.resource_group          # all display

}
