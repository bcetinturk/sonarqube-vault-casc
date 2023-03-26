resource "azurerm_key_vault_access_policy" "kvap_vault" {
  key_vault_id = azurerm_key_vault.kv_sonarqube.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Get",
    "List",
    "Create",
    "GetRotationPolicy",
  ]
}
