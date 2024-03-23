resource "azurerm_resource_group" "rg" {
  name     = var.az_rg
  location = var.location
}

resource "azurerm_container_registry" "myacr" {
  name                = var.acr
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_container_app_environment" "myappenv" {
  name                = "${var.resource_prefix}environment"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_container_app" "myapps" {
  name                         = "${var.resource_prefix}apps"
  container_app_environment_id = azurerm_container_app_environment.myappenv.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Multiple"

  template {
    container {
      name   = "examplecontainerapp"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}