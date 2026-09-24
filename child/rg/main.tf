resource "azurerm_resource_group" "k8s-rg" {
  for_each = var.k8s-rgs
  name     = each.value.rg_name
  location = each.value.location
}
