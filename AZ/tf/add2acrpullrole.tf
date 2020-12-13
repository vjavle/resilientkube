data "azurerm_container_registry" "acrglobaldevmyiis" {
  name                = "acrglobaldevresilientglobal"
  resource_group_name = "rg-global-dev-resilientglobal"
}

resource "azurerm_role_assignment" "acrpull_role" {
for_each = var.dr_regions
scope                            = data.azurerm_container_registry.acrglobaldevmyiis.id
role_definition_name             = "AcrPull"
principal_id                     = azurerm_kubernetes_cluster.azurerm_kubernetes_cluster[each.key].kubelet_identity.0.object_id
skip_service_principal_aad_check = false
}