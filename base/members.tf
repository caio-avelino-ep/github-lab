resource "github_team" "devops" {
  name    = "devops-team"
  privacy = "secret"
}

resource "github_team" "nodejs" {
  name    = "nodejs-team"
  privacy = "secret"
}

resource "github_membership" "manager" {
  username = "luisdavidcamacho"
  role     = "member"
}

resource "github_team_membership" "manager_devops" {
  team_id  = github_team.devops.id
  username = github_membership.manager.username
}
