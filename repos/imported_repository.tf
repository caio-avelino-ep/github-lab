resource "github_repository" "tf_github_lab_spa_repository" {
  name       = "tf-lab-spa"
  visibility = "public"

  has_issues   = true
  has_projects = true
  has_wiki     = false
}
