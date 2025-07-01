provider "azurerm" {
  # Configuration options
  features {
    
  }
  subscription_id = "64595c98-2646-49eb-b5bd-4de8214bb39b"

}


# module "cosmosdb" {
#   source              = "./modules/cosmos-db"
#   resource_group_name = "demorg"
#   location            = "eastus2"
#   cosmos_account_name = "demo23-cosmosdb-account"
#   database_name       = "demo-db"
#   container_name      = "demo-container"
# }



# Create the resource group
resource "azurerm_resource_group" "demorg" {
  name     = var.resource_group_name
  location = var.location
}

# Cosmos DB module
module "cosmosdb" {
  source              = "./modules/cosmos-db"
  resource_group_name = azurerm_resource_group.demorg.name
  location            = var.location
  cosmos_account_name = var.cosmos_account_name
  database_name       = var.database_name
  container_name      = var.container_name
}


