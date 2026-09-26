resource "azurerm_subnet" "k8s-subnet" {
    for_each = var.k8s-subnet
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
  address_prefixes     = each.value.address_prefixes
}
