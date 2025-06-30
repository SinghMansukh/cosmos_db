terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
  subscription_id = "64595c98-2646-49eb-b5bd-4de8214bb39b"

}