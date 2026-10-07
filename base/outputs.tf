output "organization_id" {
  description = "The GitHub organization ID."
  value       = github_organization_settings.this.id
}

output "teams_ids" {
  description = "The IDs of the organization teams."
  type        = set(string)
  value = toset([
    github_team.devops.id,
    github_team.nodejs.id,
    github_team.security.id,
  ])
}

output "security_manager_team_slug" {
  description = "The slug of the security manager team."
  value       = github_team.security.slug
}

output "secret_names" {
  description = "The names of the organization secrets."
  type        = set(string)
  value = toset([
    github_actions_organization_secret.username.secret_name,
    github_actions_organization_secret.password.secret_name,
  ])
}

output "base_repository_name" {
  description = "The name of the base repository."
  value       = github_repository.tf_github_lab_devops_repository.name
}
