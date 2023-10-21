resource "helm_release" "datadog-agent" {
  chart      = "datadog"
  name       = "datadog-agent"
  namespace  = "datadog"
  create_namespace = true
  repository = "https://helm.datadoghq.com"

  set {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }
  set {
    name  = "datadog.appKey"
    value = var.datadog_app_key
  }
  set {
    name  = "datadog.dd_url"
    value = var.datadog_api_url
  }
  set {
    name = "targetSystem"
    value = "linux"
  }

  values = [
    file("datadog-values.yaml")
  ]
  force_update = true
}