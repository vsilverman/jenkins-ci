# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "westus2"
}

# Create a storage account 
resource "azurerm_storage_account" "example" {
  name                     = "vsexamplestorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "test"
  }
}

# Create a blob container in the storage account
resource "azurerm_storage_container" "example" {
  name                  = "testcontainer"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
