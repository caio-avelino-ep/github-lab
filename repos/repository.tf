data "github_team" "devops" {
  slug = "devops-team"
}

data "github_team" "nodejs" {
  slug = "nodejs-team"
}

data "github_team" "security" {
  slug = "security-team"
}

resource "github_repository" "tf_lab_app" {
  name                   = "tf-lab-app"
  description            = "TF GitHub lab repository for nodejs app"
  vulnerability_alerts   = true
  visibility             = "public"
  has_issues             = true
  has_projects           = true
  has_wiki               = true
  allow_squash_merge     = true
  allow_merge_commit     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  auto_init              = true
}

resource "github_team_repository" "nodejs" {
  team_id    = data.github_team.nodejs.id
  repository = github_repository.tf_lab_app.name
  permission = "push"
}

resource "github_team_repository" "security" {
  team_id    = data.github_team.security.id
  repository = github_repository.tf_lab_app.name
  permission = "push"
}

resource "github_team_repository" "devops" {
  team_id    = data.github_team.devops.id
  repository = github_repository.tf_lab_app.name
  permission = "pull"
}

resource "github_repository_file" "codeowners" {
  repository     = github_repository.tf_lab_app.name
  file           = ".github/CODEOWNERS"
  content        = "* @AvelinoOrg/${data.terraform_remote_state.base.outputs.security_manager_team_slug}"
  commit_message = "Add CODEOWNERS file"
}
