resource "azurerm_mssql_server" "primary" {
    name = var.primary_database
    resource_group_name = var.resource_group
    location = var.location
    version = var.primary_database_version
    administrator_login = var.primary_database_admin
    administrator_login_password = var.primary_database_password
}

resource "azurerm_mssql_database" "db" {
  name                = "db"
  server_id           = azurerm_mssql_server.primary.id
}
