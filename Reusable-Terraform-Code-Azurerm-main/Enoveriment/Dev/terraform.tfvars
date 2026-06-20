resource_group = {
  rg1 = {

    name       = "rg-dev-001"
    location   = "central india"
    managed_by = "terraform"
    tags = {
      envoirment = "dev"
      team       = "todappteam"
    }
  }
  rg2 = {

    name     = "rg-dev-002"
    location = "central india"
  }
}

stg = {
  stg1 = {
    name                             = "devstorage001os"
    resource_group_name              = "rg-dev-001"
    location                         = "central india"
    account_tier                     = "Standard"
    account_replication_type         = "GRS"
    account_kind                     = "StorageV2"
    cross_tenant_replication_enabled = false
    access_tier                      = "Cool"
    https_traffic_only_enabled       = true
    min_tls_version                  = "TLS1_0"
  }
  stg2 = {
    name                     = "devstorage002os"
    resource_group_name      = "rg-dev-002"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

container = {
  cont1 = {
    name                              = "container1"
    storage_account_name              = "devstorage001os"
    resource_group_name               = "rg-dev-001"
    container_access_type             = "private"
    encryption_scope_override_enabled = "true"

  }
  cont2 = {
    name                 = "container2"
    storage_account_name = "devstorage002os"
    resource_group_name  = "rg-dev-002"
  }
}

virtual_network = {
  vnet1 = {
    name                = "dev-vnet-001"
    location            = "central india"
    resource_group_name = "rg-dev-001"
    address_space       = ["10.0.0.0/16"]
    subnets = [
      {
        name             = "sub-dev-001"
        address_prefixes = ["10.0.20.0/24"]
      },
      {
        name             = "sub-dev-002"
        address_prefixes = ["10.0.30.0/24"]
      }
    ]
  }
  vnet2 = {
    name                = "dev-vnet-002"
    location            = "central india"
    resource_group_name = "rg-dev-002"
    address_space       = ["10.0.0.0/16"]
    subnets = [
      {
        name             = "sub-dev-003"
        address_prefixes = ["10.0.30.0/24"]
    }]
  }

}

pip = {
  pip1 = {
    name                 = "pip-dev-001"
    resource_group_name  = "rg-dev-001"
    location             = "central india"
    allocation_method    = "Static"
    ddos_protection_mode = "Disabled"
    tags = {
      envoirment = "dev"
      team       = "todappteam"
    }
  }
  pip2 = {
    name                 = "pip-dev-002"
    resource_group_name  = "rg-dev-002"
    location             = "central india"
    allocation_method    = "Static"
    ddos_protection_mode = "Disabled"
  }
}

nic = {
  nic1 = {
    name                 = "nic-dev-001"
    location             = "central india"
    resource_group_name  = "rg-dev-001"
    subnet_name          = "sub-dev-001"
    virtual_network_name = "dev-vnet-001"
    auxiliary_sku        = "None"
    auxiliary_mode       = "None"
    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
  nic2 = {
    name                 = "nic-dev-002"
    location             = "central india"
    resource_group_name  = "rg-dev-002"
    subnet_name          = "sub-dev-003"
    virtual_network_name = "dev-vnet-002"
    ip_configurations = {
      ip1 = {
        name                          = "internal1"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }

}
nsg = {
  nsg1 = {
    name                 = "nsg-dev-001"
    location             = "central india"
    resource_group_name  = "rg-dev-001"
    nic_name             = "nic-dev-001"
    subnet_name          = "sub-dev-001"
    virtual_network_name = "dev-vnet-001"
    tags = {
      envoirment = "dev"
      team       = "todappteam"
    }
    security_rules = {
      s1 = {
        name                       = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
  nsg2 = {
    name                 = "nsg-dev-002"
    location             = "central india"
    resource_group_name  = "rg-dev-002"
    nic_name             = "nic-dev-002"
    subnet_name          = "sub-dev-003"
    virtual_network_name = "dev-vnet-002"
    security_rules = {
      s2 = {
        name                       = "test1234"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

keyvault = {
  key1 = {
    name                        = "keyvault001os"
    resource_group_name         = "rg-dev-001"
    location                    = "central india"
    enabled_for_disk_encryption = "true"
    soft_delete_retention_days  = "7"
    purge_protection_enabled    = "false"
    sku_name                    = "standard"
  }
  key2 = {
    name                        = "keyvault002os"
    resource_group_name         = "rg-dev-002"
    location                    = "central india"
    enabled_for_disk_encryption = "true"
    soft_delete_retention_days  = "7"
    purge_protection_enabled    = "false"
    sku_name                    = "standard"
  }
}

secrets = {
  secret1 = {
    key_name            = "keyvault001os"
    resource_group_name = "rg-dev-001"
    secret_name         = "vm1"
    secret_value        = "Oves@123"
  }
  secret2 = {
    key_name            = "keyvault001os"
    resource_group_name = "rg-dev-001"
    secret_name         = "password1"
    secret_value        = "oves@12345"
  }
  secret3 = {
    key_name            = "keyvault002os"
    resource_group_name = "rg-dev-002"
    secret_name         = "vm2"
    secret_value        = "anjali2"
  }
  secret4 = {
    key_name            = "keyvault002os"
    resource_group_name = "rg-dev-002"
    secret_name         = "password2"
    secret_value        = "oves@12345"
  }
}
servers = {
  server1 = {
    name                          = "serverdbos1"
    location                      = "central india"
    resource_group_name           = "rg-dev-001"
    public_network_access_enabled = true
    administrator_login           = "server15"
    administrator_login_password  = "Oves@12345"
    version                       = "12.0"
  }
  server2 = {
    name                          = "serverdbos2"
    location                      = "central india"
    resource_group_name           = "rg-dev-002"
    public_network_access_enabled = true
    administrator_login           = "server14"
    administrator_login_password  = "Oves@12345"
    version                       = "12.0"
  }
}
database = {
  db1 = {
    name                = "osdb01"
    server_name         = "serverdbos1"
    resource_group_name = "rg-dev-001"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
  }
  db2 = {
    name                = "osdb02"
    server_name         = "serverdbos2"
    resource_group_name = "rg-dev-002"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
  }

}

vms = {
  vm1 = {
    vm_name             = "dev-vm-001os"
    resource_group_name = "rg-dev-001"
    location            = "central india"
    size                = "Standard_F2"
    nic_name            = "nic-dev-001"
    key_name            = "keyvault001os"
    secret_name         = "vm1"
    secret_value        = "password1"
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    source_image_reference = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    ]
  }
  vm2 = {
    vm_name             = "dev-vm-002os"
    resource_group_name = "rg-dev-002"
    location            = "central india"
    size                = "Standard_F2"
    nic_name            = "nic-dev-002"
    key_name            = "keyvault002os"
    secret_name         = "vm2"
    secret_value        = "password2"
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    source_image_reference = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    ]
  }
}


