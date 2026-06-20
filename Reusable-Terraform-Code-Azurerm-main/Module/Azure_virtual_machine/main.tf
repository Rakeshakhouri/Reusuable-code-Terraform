resource "azurerm_linux_virtual_machine" "vm" {

  for_each                        = var.vms
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  admin_username                  = data.azurerm_key_vault_secret.admin_name[each.key].name
  admin_password                  = data.azurerm_key_vault_secret.admin_password[each.key].value
  disable_password_authentication = false
  size                            = each.value.size
#   custom_data                     = each.value.script_name != null ? base64encode(file(each.value.script_name)) : null


  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]

  dynamic "os_disk" {
    for_each = each.value.os_disk == null ? [] : each.value.os_disk
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference == null ? [] : each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      version   = source_image_reference.value.version
      sku       = source_image_reference.value.sku
      offer     = source_image_reference.value.offer
    }
  }


}
