data "github_organization_roles" "all" {}

locals {
  security_manager_role_id = one([
    for role in data.github_organization_roles.all.roles : role.role_id
    if role.name == "security_manager"
  ])
}

resource "github_team" "security" {
  name    = "security-team"
  privacy = "closed"
}

resource "github_organization_role_team" "security_managers" {
  role_id   = local.security_manager_role_id
  team_slug = github_team.security.slug
}
