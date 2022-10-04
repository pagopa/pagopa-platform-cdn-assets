variable "dev_subscription_name" {
  type        = string
  description = "DEV Subscription name"
}

variable "uat_subscription_name" {
  type        = string
  description = "UAT Subscription name"
}

variable "prod_subscription_name" {
  type        = string
  description = "PROD Subscription name"
}

variable "project_name_prefix" {
  type        = string
  description = "Project name prefix (e.g. selc)"
}

locals {
  project_prefix_short = "project_prefix_short_e_g_selc_cstar"
  azure_devops_org     = "pagopaspa"
  github_org           = "pagopa"

  # 🔐 KV
  dev_key_vault_name  = "${local.project_prefix_short}-d-azdo-weu-kv"
  uat_key_vault_name  = "${local.project_prefix_short}-u-azdo-weu-kv"
  prod_key_vault_name = "${local.project_prefix_short}-p-azdo-weu-kv"

  dev_key_vault_resource_group  = "${local.project_prefix_short}-d-sec-rg"
  uat_key_vault_resource_group  = "${local.project_prefix_short}-u-sec-rg"
  prod_key_vault_resource_group = "${local.project_prefix_short}-p-sec-rg"

  #
  # IaC
  #
  iac-variables = {}
  # global secrets
  iac-variables_secret = {}

  # code_review vars
  iac-variables_code_review = {}
  # code_review secrets
  iac-variables_secret_code_review = {}

  # deploy vars
  iac-variables_deploy = {}
  # deploy secrets
  iac-variables_secret_deploy = {}
}
