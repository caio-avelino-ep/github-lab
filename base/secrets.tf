resource "github_actions_organization_secret" "username" {
  secret_name             = "username"
  visibility              = "selected"
  plaintext_value         = var.username
  selected_repository_ids = [data.github_repository.tf_lab_app.repo_id]
}

resource "github_actions_organization_secret" "password" {
  secret_name             = "password"
  visibility              = "selected"
  plaintext_value         = var.password
  selected_repository_ids = [data.github_repository.tf_lab_app.repo_id]
}
