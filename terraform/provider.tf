terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }

    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }

    time = {
      source = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "azurerm" {
  features {}
}
