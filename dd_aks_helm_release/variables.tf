variable "datadog_api_key" {
  type = string
}
variable "datadog_app_key" {
  type = string
}
variable "datadog_site" {
  type    = string
  default = "us5.datadoghq.com"
}

variable "location" {
  default = "eastus"
}

variable "resource_group" {
  default = "main"
}

variable "aks_name" {
  default = "aks-devops"
}