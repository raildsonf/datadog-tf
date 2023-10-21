variable "datadog_api_key" {
  type = string
}
variable "datadog_app_key" {
  type = string
}
variable "datadog_api_url" {
  type    = string
  default = "https://us5.datadoghq.com/"
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