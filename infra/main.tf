resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_container_registry" "myacr" {
  name                = var.acr
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = false
}
resource "azurerm_service_plan" "service-plan" {
  name                = var.service-plan-name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}


resource "azurerm_linux_web_app" "app" {
  name                = var.appname
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.service-plan.location
  service_plan_id     = azurerm_service_plan.service-plan.id

  site_config {
    always_on        = "true"
    linux_fx_version = "DOCKER|${var.docker_image}"
  }

  logs {
    application_logs {
      file_system_level = "Verbose"
    }
    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 35
      }
    }
  }
}