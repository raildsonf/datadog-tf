variable "datadog_api_key" {
  type    = string
  default = "1037f095e182cfc365e3825e5c8ada45"
}
variable "datadog_app_key" {
  type    = string
  default = "8d0e946d9a3fee4d8737feb6a9ced5ed2f9e3cba"
}
variable "datadog_api_url" {
  type = string
  default = "https://us5.datadoghq.com/"
}

variable "system_disk_used" {
  type = map(string)
  default = {
    critical = 90
    warning  = 85
  }
}

variable "datadog_alert_footer" {
  default = <<EOF
            @raildsonfelipe@outlook.com 
            EOF
}