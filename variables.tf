variable "create_virtual_network" {
  description = "A flag to create a virtual network"
  type        = bool
}

variable "environment" {
  description = "The environment that the resources are created in"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_name_prefix" {
  description = "The prefix that is used for the subnet names"
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
  default     = null
}

variable "virtual_network_location" {
  description = "The location/region where the virtual network is created"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}
