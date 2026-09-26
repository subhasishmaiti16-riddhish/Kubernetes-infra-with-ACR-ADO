resource "azurerm_kubernetes_cluster" "k8s-aks" {
  for_each            = var.k8s-aks
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = "subhaaks"

  node_provisioning_profile {
    mode = "Auto"
  }

  default_node_pool {
    name                 = "system"
    node_count           = 2
    vm_size              = "Standard_EC2as_v6"
    vnet_subnet_id = data.azurerm_subnet.k8s-subnet[each.key].id
  
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

