k8s-env-rgs = {
  k8s-rgs1 = {
    rg_name  = "k8s-rgs"
    location = "CentralIndia"
  }
}
k8s-env-vnet = {
  k8s-vnet1 = {
    vnet_name     = "k8s-vnet"
    location      = "CentralIndia"
    rg_name       = "k8s-rgs"
    address_space = ["10.0.0.0/16"]
  }
}

k8s-env-subnet = {
  k8s-subnet1 = {
    subnet_name      = "k8s-subnet"
    vnet_name        = "k8s-vnet"
    rg_name          = "k8s-rgs"
    address_prefixes = ["10.0.0.1/24"]
  }
  k8s-subnet2 = {
    subnet_name      = "AzureApplicationGateway"
    vnet_name        = "k8s-vnet"
    rg_name          = "k8s-rgs"
    address_prefixes = ["10.0.0.2/24"]
  }
  k8s-subnet3 = {
    subnet_name      = "k8s-subnet1"
    vnet_name        = "k8s-vnet"
    rg_name          = "k8s-rgs"
    address_prefixes = ["10.0.0.3/24"]
  }
}
k8s-env-acr = {
  k8s-acr = {
    acr_name = "k8sacr"
    rg_name  = "k8s-rgs"
    location = "CentralIndia"
    sku      = "Standard"
  }
}
k8s-env-aks = {
  k8s-aks = {
    aks_name  = "k8s-aks"
    location  = "CentralIndia"
    rg_name   = "k8s-rgs"
    vnet_name = "k8s-vnet"
  }
}
