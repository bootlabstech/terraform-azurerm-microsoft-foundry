variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group where all resources will be created."
}

variable "name" {
  type        = string
  description = "Base name used for naming all related Azure resources to maintain consistency."
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be deployed (e.g., centralindia, eastus)."
}

variable "sku_name" {
  type        = string
  description = "SKU (pricing tier) for the Cognitive Services account (e.g., S0, S1)."
}

variable "custom_subdomain_name" {
  type        = string
  description = "Custom subdomain name for the Cognitive Services endpoint. Must be globally unique."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether public network access is allowed for the Cognitive Services account. Set to false for private access only."
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the private endpoint will be created."
}

variable "private_dns_zone_id" {
  type        = string
  description = "ID of the Private DNS Zone used for resolving the private endpoint of the Cognitive Services account."
}

variable "default_action" {
  type        = string
  default     = "Deny"
  description = "Default network access rule action. Use 'Allow' to permit all traffic or 'Deny' to restrict access based on rules."
}