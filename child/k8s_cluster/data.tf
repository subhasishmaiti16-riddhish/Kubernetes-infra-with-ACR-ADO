data "azurerm_virtual_network" "k8s-vnet" {
  for_each            = var.k8s-aks
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
}
