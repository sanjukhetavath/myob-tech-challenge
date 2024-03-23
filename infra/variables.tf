variable "client_id" {
  type        = string
  description = "Azure Client id"
}

variable "client_secret" {
  type        = string
  description = "Azure client Secret "
}

variable "tenant_id" {
  type        = string
  description = " Azure tenant_id"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription id"
}

variable "resource_prefix" {
  type        = string
  description = "resource prefix name"
  default     = "weathermyob"
}

variable "location" {
  type        = string
  description = "Resource group Location"
  default     = "Australia East"
}

variable "acr" {
  type        = string
  description = "name of the acr"

}

variable "az_rg" {
  type        = string
  description = "name of resource group"

}