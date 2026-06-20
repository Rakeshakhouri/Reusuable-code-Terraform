module "resource_group" {
  source         = "../../Module/Azure_Resource_Group"
  resource_group = var.resource_group
}
module "storage_account" {
  depends_on      = [module.resource_group]
  source          = "../../Module/Azure_Storage_Account"
  storage_account = var.stg
}
module "container" {
  depends_on = [module.storage_account]
  source     = "../../Module/Azure_container"
  container  = var.container
}
module "virtual_network" {
  depends_on      = [module.resource_group]
  source          = "../../Module/Azure_virtual_network"
  virtual_network = var.virtual_network
}
module "pip" {
  depends_on = [module.resource_group]
  source     = "../../Module/Azure_Public_ip"
  pip        = var.pip
}
module "nic" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../Module/Azure_network_interface_card"
  nic        = var.nic
}
module "nsg" {
  depends_on = [module.resource_group, module.pip, module.nic]
  source     = "../../Module/Azure_network_security_group"
  nsg        = var.nsg
}
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../Module/Azure_key_vault"
  keyvault   = var.keyvault
}
module "key_secrets" {
  depends_on = [module.key_vault]
  source     = "../../Module/Azure_key_secrets"
  secrets    = var.secrets
}
module "mysql_server" {
  depends_on = [module.resource_group]
  source     = "../../Module/Azure_mysql_server"
  servers    = var.servers
}
module "mysql_database" {
  depends_on = [module.mysql_server,module.resource_group]
  source     = "../../Module/Azure_mysql_database"
  database   = var.database

}
module "virtual_machine" {
  depends_on = [ module.nic,module.nsg,module.pip,module.key_secrets,module.key_vault,module.resource_group,module.virtual_network ]
  source = "../../Module/Azure_virtual_machine"
  vms = var.vms
}

