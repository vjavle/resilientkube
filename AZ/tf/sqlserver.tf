resource "azurerm_sql_server" "sql_subscription_bzunit_env_region" {
  for_each = var.dr_regions
  name                         = format("sql-%s-%s-%s", each.key, var.environment,var.application_name)
  resource_group_name          = azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name
  location                     = each.value
  version                      = "12.0"
  administrator_login          = var.administrator_login_uid
  administrator_login_password = var.administrator_login_pwd
  tags     = {
      "business_unit" = var.business_unit
  }
}