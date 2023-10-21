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

variable "system_utilized" {
  type = map(string)
  default = {
    critical = 90
    warning  = 80
  }
}

variable "datadog_alert_footer" {
  default = <<EOF
            @raildsonfelipe@outlook.com
            EOF
}

variable "common_tags" {
  type = set(string)
  default = [ "Team:SRE", "Proj:Observability", "OU:infra" ]
}