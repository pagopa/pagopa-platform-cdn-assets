resource "azuredevops_team" "external_team" {
  project_id = azuredevops_project.project.id
  name       = "${local.project_prefix_short}-projects-externals-team"
}
