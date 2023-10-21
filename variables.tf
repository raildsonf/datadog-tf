variable "datadog_api_key" {
  type    = string
}
variable "datadog_app_key" {
  type    = string
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