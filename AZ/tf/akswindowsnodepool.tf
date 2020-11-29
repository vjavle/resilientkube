resource "azurerm_kubernetes_cluster_node_pool" "azurerm_kubernetes_cluster_windows_node_pool" {
    for_each                = var.dr_regions
    name                    = format("wnp%s", each.key)
    kubernetes_cluster_id   = azurerm_kubernetes_cluster.azurerm_kubernetes_cluster[each.key].id
    vm_size                 = "Standard_D2S_v3"
    node_count              = 1
    os_type                 = "Windows"

    tags = {
        "business_unit" = var.business_unit
    }
}