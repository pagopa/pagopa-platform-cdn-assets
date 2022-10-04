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
  description = "Project name project_prefix (e.g. devopslab)"
}

locals {
  project_prefix_short = "short"
  azure_devops_org     = "pagopaspa"

  # 🔐 KV
  dev_key_vault_azdo_name  = "${local.project_prefix_short}-d-azdo-weu-kv"
  uat_key_vault_azdo_name  = "${local.project_prefix_short}-u-azdo-weu-kv"
  prod_key_vault_azdo_name = "${local.project_prefix_short}-p-azdo-weu-kv"

  dev_key_vault_name  = "${local.project_prefix_short}-d-kv"
  uat_key_vault_name  = "${local.project_prefix_short}-u-kv"
  prod_key_vault_name = "${local.project_prefix_short}-p-kv"

  dev_key_vault_resource_group  = "${local.project_prefix_short}-d-sec-rg"
  uat_key_vault_resource_group  = "${local.project_prefix_short}-u-sec-rg"
  prod_key_vault_resource_group = "${local.project_prefix_short}-p-sec-rg"

  # ☁️ VNET
  dev_vnet_rg  = "${local.project_prefix_short}-d-vnet-rg"
  uat_vnet_rg  = "${local.project_prefix_short}-u-vnet-rg"
  prod_vnet_rg = "${local.project_prefix_short}-p-vnet-rg"

  # 📦 ACR DEV DOCKER
  srv_endpoint_name_docker_registry_dev = "${local.project_prefix_short}-acr_docker_registry_dev"
  docker_registry_rg_name_dev           = "${local.project_prefix_short}-d-docker-rg"
  docker_registry_name_dev              = "${local.project_prefix_short}dacr"

  # 📦 ACR UAT DOCKER
  srv_endpoint_name_docker_registry_uat = "${local.project_prefix_short}-acr_docker_registry_uat"
  docker_registry_rg_name_uat           = "${local.project_prefix_short}-u-docker-rg"
  docker_registry_name_uat              = "${local.project_prefix_short}uacr"

  # 📦 ACR PROD DOCKER
  srv_endpoint_name_docker_registry_prod = "${local.project_prefix_short}-acr_docker_registry_prod"
  docker_registry_rg_name_prod           = "${local.project_prefix_short}-p-docker-rg"
  docker_registry_name_prod              = "${local.project_prefix_short}pacr"

  #tfsec:ignore:general-secrets-no-plaintext-exposure
  #tfsec:ignore:GEN002
  tlscert_renew_token = "v1"
}
