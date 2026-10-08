resource "github_actions_organization_permissions" "tf_lab_app" {
  allowed_actions      = "selected"
  enabled_repositories = "selected"

  allowed_actions_config {
    github_owned_allowed = true
    patterns_allowed = [
      "actions/checkout@v4",
      "actions/setup-java@v4",
      "actions/setup-node@v4",
    ]
    verified_allowed = false
  }

  enabled_repositories_config {
    repository_ids = [data.github_repository.tf_lab_app.repo_id]
  }
}
