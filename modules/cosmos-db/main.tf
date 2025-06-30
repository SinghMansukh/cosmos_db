# resource "azurerm_resource_group" "demorg" {
#   name     = var.resource_group_name
#   location = var.location
# }

# resource "azurerm_cosmosdb_account" "demo23-cosmosdb-account" {
#   name                = var.cosmos_account_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   offer_type          = "Standard"
#   kind                = "GlobalDocumentDB"

#   consistency_policy {
#     consistency_level = var.consistency_level
#   }

#   geo_location {
#     location          = var.location
#     failover_priority = 0
#   }

#   public_network_access_enabled = false

# backup {
#   type = "Continuous"
# }
#   # dynamic "capabilities" {
#   #   for_each = var.enable_serverless ? [1] : []
#   #   content {
#   #     name = "EnableServerless"
#   #   }
#   # }
# }

# resource "azurerm_cosmosdb_sql_database" "cosmossqldb" {
#   name                = var.database_name
#   resource_group_name = var.resource_group_name
#   account_name        = azurerm_cosmosdb_account.this.name
# }

# resource "azurerm_cosmosdb_sql_container" "example" {
#   name                  = var.container_name
#   resource_group_name   = var.resource_group_name
#   account_name          = var.cosmos_account_name
#   database_name         = var.database_name
#   partition_key_paths   = ["/definition/id"]
#   # partition_key_version = 1
#   # throughput            = 400

#   # indexing_policy {
#   #   indexing_mode = "consistent"

#   #   included_path {
#   #     path = "/*"
#   #   }

#   #   included_path {
#   #     path = "/included/?"
#   #   }

#   #   excluded_path {
#   #     path = "/excluded/?"
#   #   }
#   # }

#   # unique_key {
#   #   paths = ["/definition/idlong", "/definition/idshort"]
#   # }
# }





resource "azurerm_cosmosdb_account" "this" {
  name                = var.cosmos_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = var.consistency_level
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  public_network_access_enabled = false

  backup {
    type = "Continuous"
  }

  dynamic "capabilities" {
    for_each = var.enable_serverless ? [1] : []
    content {
      name = "EnableServerless"
    }
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmossqldb" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name

  depends_on = [azurerm_cosmosdb_account.this]
}

resource "azurerm_cosmosdb_sql_container" "example" {
  name                = var.container_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  database_name       = var.database_name
  partition_key_paths  = [var.partition_key_path]
  #throughput          = var.throughput


  depends_on = [azurerm_cosmosdb_sql_database.cosmossqldb]
}

