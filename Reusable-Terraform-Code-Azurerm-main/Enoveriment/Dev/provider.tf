terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
#   backend "azurerm" {
#     resource_group_name = ""
#     storage_account_name = "abcd1234"
#     container_name       = "tfstate"
#     key                  = "prod.terraform.tfstate" #
#   }
}

provider "azurerm" {
  features {}
  #   api_management {
  #     purge_soft_delete_on_destroy = true
  #     recover_soft_deleted         = true
  #   }

  #   app_configuration {
  #     purge_soft_delete_on_destroy = true
  #     recover_soft_deleted         = true
  #   }

  #   application_insights {
  #     disable_generated_rule = false
  #   }

  #   cognitive_account {
  #     purge_soft_delete_on_destroy = true
  #   }

  #   databricks_workspace {
  #     force_delete = false
  #   }

  #   key_vault {
  #     purge_soft_delete_on_destroy    = true
  #     recover_soft_deleted_key_vaults = true
  #   }

  #   log_analytics_workspace {
  #     permanently_delete_on_destroy = true
  #   }

  #   machine_learning {
  #     purge_soft_deleted_workspace_on_destroy = true
  #   }

  #   managed_disk {
  #     expand_without_downtime = true
  #   }

  #   netapp {
  #     delete_backups_on_backup_vault_destroy = false
  #     prevent_volume_destruction             = true
  #   }

  #   postgresql_flexible_server {
  #     restart_server_on_configuration_value_change = true
  #   }

  #   recovery_service {
  #     vm_backup_stop_protection_and_retain_data_on_destroy    = true
  #     vm_backup_suspend_protection_and_retain_data_on_destroy = true
  #     purge_protected_items_from_vault_on_destroy             = true
  #   }

  #   resource_group {
  #     prevent_deletion_if_contains_resources = true
  #   }

  #   storage {
  #     data_plane_available = false
  #   }

  #   subscription {
  #     prevent_cancellation_on_destroy = false
  #   }

  #   template_deployment {
  #     delete_nested_items_during_deletion = true
  #   }

  #   virtual_machine {
  #     detach_implicit_data_disk_on_deletion = false
  #     delete_os_disk_on_deletion            = true
  #     skip_shutdown_and_force_delete        = false
  #   }

  #   virtual_machine_scale_set {
  #     force_delete                  = false
  #     roll_instances_when_required  = true
  #     scale_to_zero_before_deletion = true
  #   }
  # }
  subscription_id = "2a6429ab-34bc-4c09-812c-9e5d8ceee0d7"
}

 
