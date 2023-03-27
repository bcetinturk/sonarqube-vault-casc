resource "local_file" "ansible_vars_file" {
  content = <<-EOF
    AZURE_CLIENT_ID: "${var.client_id}"
    AZURE_CLIENT_SECRET: "${var.client_secret}"
    AZURE_TENANT_ID: "${var.tenant_id}"
    VAULT_AZUREKEYVAULT_KEY_NAME: "kvk-vault-autounseal-key"
    VAULT_AZUREKEYVAULT_VAULT_NAME: "kv-sq-${random_pet.kvname.id}"
    VAULT_SEAL_TYPE: "azurekeyvault"
    EOF
  filename = "../ansible/vars.yml"
}