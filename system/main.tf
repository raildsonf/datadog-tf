locals {
  common_tags = var.common_tags
}

#disk
resource "datadog_monitor" "system_disk_utilized" {
  name           = "System Disk utilization by host"
  query          = "avg(last_5m):avg:system.disk.utilized{device:/dev/sda3} by {host} > ${var.system_utilized["critical"]}"
  type           = "metric alert"
  notify_no_data = false
  include_tags   = true
  tags         = local.common_tags
  monitor_thresholds {
    warning  = var.system_utilized["warning"]
    critical = var.system_utilized["critical"]
  }
  message = <<EOM
                    {{#is_alert}}
                    Root Usage is {{value}}%.
                    {{/is_alert}} 

                    {{#is_recovery}}
                    Root Usage returned to a safe message                  = <<EOM
                              {{#is_alert}}\nCPU Usage is {{value}}%.
                              {{/is_alert}}
                              {{#is_recovery}}
                              CPU  Usage returned to a safe state, {{value}}%.
                              {{/is_recovery}}\n```
                              ${var.datadog_alert_footer}"
                              EOMstate, {{value}}%.
                    {{/is_recovery}}
                    ${var.datadog_alert_footer}
                  EOM
}

#CPU
resource "datadog_monitor" "system_cpu_utilized" {
  name         = "System CPU utilization by host"
  type         = "query alert"
  query        = "avg(last_5m):avg:system.cpu.user{*} by {host} > ${var.system_utilized["critical"]}"
  include_tags = true
  tags         = local.common_tags
  monitor_thresholds {
    warning  = var.system_utilized["warning"]
    critical = var.system_utilized["critical"]
  }
  message = <<EOM
                              {{#is_alert}}\nCPU Usage is {{value}}%.
                              {{/is_alert}}
                              {{#is_recovery}}
                              CPU  Usage returned to a safe state, {{value}}%.
                              {{/is_recovery}}\n```
                              ${var.datadog_alert_footer}"
                              EOM
}


# import {
#   to = datadog_monitor.system_cpu_utilized
#   id = "291605"
# }

