resource "azurerm_virtual_network" "principal" {
  name                = var.virtual_network_name
  location            = var.virtual_network_location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_address_space
}

resource "azurerm_subnet" "principal_public" {
  name                 = "${var.subnet_name_prefix}-public"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.principal.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.principal.address_space[0], 8, 0)]
}

resource "azurerm_subnet" "principal_private" {
  name                 = "${var.subnet_name_prefix}-private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.principal.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.principal.address_space[0], 8, 10)]
}

resource "azurerm_subnet" "principal_database" {
  name                 = "${var.subnet_name_prefix}-database"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.principal.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.principal.address_space[0], 8, 20)]
}
