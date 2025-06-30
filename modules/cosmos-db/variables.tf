# variable "resource_group_name" {
#   type        = string  
#   description = "Name of the resource group"
#   # default = "demorg"
# }

# variable "location" {
#   type        = string
#   description = "Azure location"
# }

# variable "cosmos_account_name" {
#   type        = string
#   description = "Cosmos DB account name"
# }

# variable "database_name" {
#   type        = string
#   description = "Cosmos DB SQL database name"
# }

# variable "container_name" {
#   type        = string
#   description = "Cosmos DB SQL container name"
#   default = "value"
# }

# variable "partition_key_path" {
#   type        = string
#   description = "Partition key path"
#   default     = "definition/id"
# }

# variable "throughput" {
#   type        = number
#   description = "Throughput for the container"
#   default     = 400
# }

# variable "consistency_level" {
#   type        = string
#   description = "Cosmos DB consistency level"
#   default     = "Session"
# }

# variable "enable_serverless" {
#   type        = bool
#   description = "Enable serverless capability"
#   default     = true
# }




variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location for resources"
}

variable "cosmos_account_name" {
  type        = string
  description = "Cosmos DB account name"
}

variable "database_name" {
  type        = string
  description = "SQL database name"
}

variable "container_name" {
  type        = string
  description = "SQL container name"
}

variable "partition_key_path" {
  type        = string
  default     = "/definition/id"
  description = "Partition key path"
}

variable "throughput" {
  type        = number
  default     = 400
  description = "Throughput for Cosmos DB container"
}

variable "consistency_level" {
  type        = string
  default     = "Session"
  description = "Consistency level"
}

variable "enable_serverless" {
  type        = bool
  default     = true
  description = "Enable serverless capability"
}
