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
    node_count           = 1
    vm_size              = "Standard_D2s_v5"
    vnet_subnet_id = data.azurerm_subnet.k8s-subnet[each.key].id
  
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.1.0.0/16"
    dns_service_ip = "10.1.0.10"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

