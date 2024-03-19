data "azurerm_virtual_network" "principal" {
  count = var.create_virtual_network ? 0 : 1

  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "principal" {
  count = var.create_virtual_network ? 1 : 0

  name                = var.virtual_network_name
  location            = var.virtual_network_location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_address_space
}

locals {
  virtual_network_name          = var.create_virtual_network ? azurerm_virtual_network.principal[0].name : data.azurerm_virtual_network.principal[0].name
  virtual_network_address_space = var.create_virtual_network ? azurerm_virtual_network.principal[0].address_space : data.azurerm_virtual_network.principal[0].address_space
}

resource "azurerm_subnet" "principal_public" {
  name                 = "${var.subnet_name_prefix}-public"
  resource_group_name  = var.resource_group_name
  virtual_network_name = local.virtual_network_name
  address_prefixes     = [cidrsubnet(local.virtual_network_address_space[0], 8, 10)]
}

resource "azurerm_subnet" "principal_private" {
  name                 = "${var.subnet_name_prefix}-private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = local.virtual_network_name
  address_prefixes     = [cidrsubnet(local.virtual_network_address_space[0], 8, 11)]
}

resource "azurerm_subnet" "principal_database" {
  name                 = "${var.subnet_name_prefix}-database"
  resource_group_name  = var.resource_group_name
  virtual_network_name = local.virtual_network_name
  address_prefixes     = [cidrsubnet(local.virtual_network_address_space[0], 8, 20)]
}
