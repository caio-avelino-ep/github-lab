data "github_organization" "this" {
  name         = "AvelinoOrg"
  summary_only = true
}

data "github_organization_teams" "all" {}

locals {
  security_manager_team_slug = one([
    for team in data.github_organization_teams.all.teams : team.slug
    if team.slug == "security-team"
  ])
}
