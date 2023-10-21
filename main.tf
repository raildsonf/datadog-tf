resource "datadog_monitor" "system_disk_used" {
  name           = "System Disk Used"
  query          = "avg(last_5m):avg:system.disk.used{*} by {host} * 100 > ${var.system_disk_used["critical"]}"
  type           = "metric alert"
  notify_no_data = false
  include_tags   = true
  monitor_thresholds {
    warning  = var.system_disk_used["warning"]
    critical = var.system_disk_used["critical"]
  }
  message = <<EOM
                    {{#is_alert}}
                    Drive Usage is {{value}}.
                    {{/is_alert}} 

                    {{#is_recovery}}
                    Drive Usage returned to a safe state, {{value}}.
                    {{/is_recovery}}
                    ${var.datadog_alert_footer}
                  EOM
}