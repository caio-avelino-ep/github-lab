resource "github_actions_organization_secret" "username" {
  secret_name     = "username"
  visibility      = "selected"
  plaintext_value = var.username
}

resource "github_actions_organization_secret" "password" {
  secret_name     = "password"
  visibility      = "selected"
  plaintext_value = var.password
}
