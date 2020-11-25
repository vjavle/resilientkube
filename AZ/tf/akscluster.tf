resource "azurerm_kubernetes_cluster" "azurerm_kubernetes_cluster" {
    for_each = var.dr_regions
    name                = format("aks-%s-%s-%s", each.key, var.environment,var.application_name)
    location = each.value
    tags     = {
        "business_unit" = var.business_unit
    }

    resource_group_name = azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name
    dns_prefix          = format("aks-%s-%s-%s", each.key, var.environment,var.application_name)

    default_node_pool {
        name            = "default"
        node_count      = 2
        vm_size         = "Standard_D2_v2"
        os_disk_size_gb = 30
    }

#    service_principal {
#        client_id     = var.appId
#        client_secret = var.password
#    }

    identity {
        type = "SystemAssigned"
    }

    role_based_access_control {
        enabled = true
    }

    addon_profile {
        kube_dashboard {
            enabled = true
        }
    }
}
