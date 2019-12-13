resource "azurerm_virtual_network" "network" {
  name                = "aks-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                      = "aks-subnet"
  resource_group_name       = azurerm_resource_group.rg.name
  address_prefix            = "10.1.0.0/24"
  virtual_network_name      = azurerm_virtual_network.network.name
}