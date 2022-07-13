# Create iac-common-terraform-github repository
resource "github_repository" "repo_github" {
  name        = "iac-common-terraform-github"
  description = "Repositorio para github"
  visibility  = "public"

  template {
    owner      = "devops-manuel"
    repository = "repository-template"
  }

}

# Add memberships for repo_github repository
resource "github_team_repository" "repo_github" {
  for_each = {
    for team in local.repo_teams_files["iac-common-terraform-github"] :
    team.team_name => {
      team_id    = github_team.all[team.team_name].id
      permission = team.permission
    } if lookup(github_team.all, team.team_name, false) != false
  }

  team_id    = each.value.team_id
  repository = github_repository.repo_github.id
  permission = each.value.permission
}
