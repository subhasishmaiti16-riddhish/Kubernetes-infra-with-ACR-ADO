module "k8s-env-rgs" {
  source = "../child/rg"
  k8s-rgs = var.k8s-env-rgs
}

module "k8s-env-vnet" {
    depends_on = [ module.k8s-env-rgs ]
  source = "../child/vnet"
  k8s-vnet = var.k8s-env-vnet
}
module "k8s-env-subnet" {
    depends_on = [ module.k8s-env-vnet ]
  source = "../child/subnet"
  k8s-subnet = var.k8s-env-subnet
}
module "k8s-env-aks" {
    depends_on = [ module.k8s-env-rgs, module.k8s-env-subnet ]
  source = "../child/k8s_cluster"
  k8s-aks = var.k8s-env-aks
}
module "k8s-env-acr" {
    depends_on = [ module.k8s-env-rgs ]
  source = "../child/acr"
  k8s-acr = var.k8s-env-acr
}
