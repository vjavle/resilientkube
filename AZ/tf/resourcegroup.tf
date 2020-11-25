resource "azurerm_resource_group" "rg_subscription_bzunit_env_region" {
  for_each = var.dr_regions
  name     = format("rg-%s-%s-%s", each.key, var.environment,var.application_name)
  location = each.value
  tags     = {
      "business_unit" = var.business_unit
  }
}