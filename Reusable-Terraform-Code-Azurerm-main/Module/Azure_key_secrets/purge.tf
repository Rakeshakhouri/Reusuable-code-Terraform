resource "null_resource" "purge_deleted_secrets" {
  for_each = var.secrets

  provisioner "local-exec" {
   command = "powershell -Command \"try { az keyvault secret purge --name ${each.value.secret_name} --vault-name ${each.value.key_name} } catch { Write-Host 'Secret not found or already purged' }\""
  }

  triggers = {
    secret_name   = each.value.secret_name 
    keyvault_name = each.value.key_name 
  }
}
