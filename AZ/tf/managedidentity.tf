resource "azurerm_user_assigned_identity" "example" {

    for_each = var.dr_regions
    name                = format("mi-%s-%s-%s", each.key, var.environment,var.application_name)
    location = each.value
    tags     = {
        "business_unit" = var.business_unit
    }

    resource_group_name = azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name
}