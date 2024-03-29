provider "azurerm" {
    features {}
}
variable "location" {
  default = "eastus"
}
variable "name" {
  default = "hs-bajaj"
}
resource "azurerm_resource_group" "hs-bajaj" {
  location = var.location
  name = var.name
  tags = {
    Name = "Heta"
    Day = "5"
  }
}
resource "azurerm_cosmosdb_account" "GlobalDocumentDB" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.hs-bajaj.name
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  enable_automatic_failover = false
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
}
