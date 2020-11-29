resource "azurerm_kubernetes_cluster" "azurerm_kubernetes_cluster" {
    for_each = var.dr_regions
    name                = format("aks-%s-%s-%s", each.key, var.environment,var.application_name)
    location = each.value
    tags     = {
        "business_unit" = var.business_unit
    }

    resource_group_name = azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name
    node_resource_group = format("%s-nodes", azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name)
    
    

    dns_prefix          = format("aks-%s-%s-%s", each.key, var.environment,var.application_name)

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_D2_v2"
        os_disk_size_gb = 30
    }

    windows_profile {
        admin_username  = "winadmin"
        admin_password  = "P@$$>1w0rd"
    }

    network_profile {
        network_plugin = "azure"
    }


#    service_principal {
#        client_id     = var.appId
#        client_secret = var.password
#    }

    identity {
        type = "SystemAssigned"
    }

    role_based_access_control {
        enabled = false
    }

    addon_profile {
        kube_dashboard {
            enabled = true
        }
    }
}
