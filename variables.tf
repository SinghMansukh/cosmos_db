variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "demorg"
}

variable "location" {
  type        = string
  description = "Azure location"
  default     = "eastus2"
}

variable "cosmos_account_name" {
  type        = string
  description = "Cosmos DB account name"
  default     = "demo2323-cosmosdb-account"
}

variable "database_name" {
  type        = string
  description = "Cosmos DB SQL database name"
  default     = "demo-db"
}

variable "container_name" {
  type        = string
  description = "Cosmos DB SQL container name"
  default     = "demo-container"
}
