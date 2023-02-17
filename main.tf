provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "cosmos-hs" {
  location = "eastus"
  name = "hs-bajaj"
  tags = {
    Name = "Heta"
    Day = "5"
  }
}
