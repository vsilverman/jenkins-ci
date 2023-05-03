resource "azurerm_resource_group" "my-terraform-azure-rs" {
  name     = var.name
  location = var.location
}
