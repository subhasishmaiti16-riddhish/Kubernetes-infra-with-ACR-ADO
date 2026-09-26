data "azurerm_subnet" "k8s-subnet" {
  for_each = var.k8s-aks

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}
