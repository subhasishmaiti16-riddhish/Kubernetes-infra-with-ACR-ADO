resource "azurerm_container_registry" "k8s-acr" {
    for_each = var.k8s-acr
  name                = each.value.acr_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = false
  
}

resource "azurerm_resource_provider_registration" "network" {
  name = "Microsoft.Network"
}

resource "azurerm_resource_provider_registration" "container_registry" {
  name = "Microsoft.ContainerRegistry"
}

resource "azurerm_resource_provider_registration" "container_service" {
  name = "Microsoft.ContainerService"
}