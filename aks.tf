resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "andrewjacksonio"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  network_profile {
    network_plugin = "azure"
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }
}