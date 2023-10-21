resource "datadog_monitor" "system_disk_utilized" {
  name           = "System Disk Utilized by host"
  query          = "avg(last_5m):avg:system.disk.utilized{device:/dev/sda3} by {host} > ${var.system_disk_utilized["critical"]}"
  type           = "metric alert"
  notify_no_data = false
  include_tags   = true
  monitor_thresholds {
    warning  = var.system_disk_utilized["warning"]
    critical = var.system_disk_utilized["critical"]
  }
  message = <<EOM
                    {{#is_alert}}
                    Root Usage is {{value}}%.
                    {{/is_alert}} 

                    {{#is_recovery}}
                    Root Usage returned to a safe state, {{value}}%.
                    {{/is_recovery}}
                    ${var.datadog_alert_footer}
                  EOM
}