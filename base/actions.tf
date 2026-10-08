resource "github_actions_organization_permissions" "tf_lab_app" {
  allowed_actions      = "all"
  enabled_repositories = "selected"

  enabled_repositories_config {
    repository_ids = [data.github_repository.tf_lab_app.repo_id]
  }
}
