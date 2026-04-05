############################################
# Cognitive Account (AI Foundry)
############################################

resource "azurerm_cognitive_account" "foundry" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  kind     = "AIServices"
  sku_name = var.sku_name

  custom_subdomain_name = "${var.name}"

  identity {
    type = "SystemAssigned"
  }

  public_network_access_enabled = var.public_network_access_enabled

  network_acls {
    default_action = var.default_action
    bypass = "None"
  }
}

############################################
# Private Endpoint
############################################

resource "azurerm_private_endpoint" "foundry_pe" {
  name                = "${var.name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-conn"
    private_connection_resource_id = azurerm_cognitive_account.foundry.id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name = "${var.name}-pvtdnsgrp"

    private_dns_zone_ids = [
      var.private_dns_zone_id
    ]
  }

}