terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resourcegroup" {
  name     = "TestRG"
  location = "South India"
}

resource "azurerm_container_group" "azurecontainer" {
  name                = "dotNetdocker"
  location            = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  ip_address_type     = "public"
  dns_name_label      = "dotnetapp"
  os_type             = "linux"

  image_registry_credential {
    server = "index.docker.io"
    username = var.docker_username
    password = var.docker_password
  }

  container {
    name   = "test-container"
    image  = "parth10/dotnetapp:latest"
    cpu    = "1.0"
    memory = "1.0"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}
