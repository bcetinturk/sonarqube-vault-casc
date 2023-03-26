
data "azurerm_client_config" "current" {
}

resource "random_pet" "kvname" {
  keepers = {
    rg_name = var.resource_group_name
  }
  length = 1
}

resource "azurerm_resource_group" "rg_sonarqube" {
  name     = var.resource_group_name
  location = "Germany West Central"
}

resource "azurerm_key_vault" "kv_sonarqube" {
  name                       = "kv-sq-${random_pet.kvname.id}"
  location                   = azurerm_resource_group.rg_sonarqube.location
  resource_group_name        = azurerm_resource_group.rg_sonarqube.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name = "standard"
}

resource "azurerm_key_vault_key" "kvk_unseal_vault" {
  name         = "kvk-vault-autounseal-key"
  key_vault_id = azurerm_key_vault.kv_sonarqube.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
  ]
}
