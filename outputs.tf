output "principal_public_subnet_id" {
  description = "The ID of the principal public subnet."
  value       = azurerm_subnet.principal_public.id
}

output "principal_public_subnet_address_prefixes" {
  description = "The address prefixes of the principal public subnet."
  value       = azurerm_subnet.principal_public.address_prefixes
}

output "principal_private_subnet_id" {
  description = "The ID of the principal private subnet."
  value       = azurerm_subnet.principal_private.id
}

output "principal_private_subnet_address_prefixes" {
  description = "The address prefixes of the principal private subnet."
  value       = azurerm_subnet.principal_private.address_prefixes
}

output "principal_database_subnet_id" {
  description = "The ID of the principal database subnet."
  value       = azurerm_subnet.principal_database.id
}

output "principal_database_subnet_address_prefixes" {
  description = "The address prefixes of the principal database subnet."
  value       = azurerm_subnet.principal_database.address_prefixes
}

output "virtual_network_address_space" {
  description = "The address space of the principal virtual network."
  value       = azurerm_virtual_network.principal.address_space
}

output "virtual_network_name" {
  description = "The name of the principal virtual network."
  value       = azurerm_virtual_network.principal.name
}
